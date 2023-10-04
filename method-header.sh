#!/bin/bash

if [ $# -eq 0 ]
then
# Define a variable
echo -e "\e[31m
                 _   _               _        _                    _           
                | | | |             | |      | |                  | |          
  _ __ ___   ___| |_| |__   ___   __| |______| |__   ___  __ _  __| | ___ _ __ 
 | '_ '  _ \/ _ \ __| '_ \ / _ \ / _  |______| '_ \ / _ \/ _  |/ _  |/ _ \ '__|
 | | | | | |  __/ |_| | | | (_) | (_| |      | | | |  __/ (_| | (_| |  __/ |
 |_| |_| |_|\___|\__|_| |_|\___/ \__,_|      |_| |_|\___|\__ _|\__,_|\___|_|   

                                                                       𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠\e[0m
                                                                       
                                                                       
                                                                       "

                                                                        
    echo -e "\e[1;31mPlease provide arguments. Use -h to know how to use this tool.\e[0m"
    exit 1
fi

while getopts l:w:d:f:h flag
do
    case "${flag}" in
        l) subdomains_file=${OPTARG};;
        w) headers_file=${OPTARG};;
        d) subdomain=${OPTARG};;
        f) IFS=',' read -ra filter <<< "${OPTARG}";;
        h)
        echo -e "\e[31m
                 _   _               _        _                    _           
                | | | |             | |      | |                  | |          
\e[32m  _ __ ___   ___| |_| |__   ___   __| |______| |__   ___  __ _  __| | ___ _ __ 
\e[33m | '_ '  _ \/ _ \ __| '_ \ / _ \ / _  |______| '_ \ / _ \/ _  |/ _  |/ _ \ '__|
\e[34m | | | | | |  __/ |_| | | | (_) | (_| |      | | | |  __/ (_| | (_| |  __/ |\e[0m  
\e[35m |_| |_| |_|\___|\__|_| |_|\___/ \__,_|      |_| |_|\___|\__ _|\__,_|\___|_|   
                                                                               
                                                                        \e[37m𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠\e[0m
                                                                        
                                                                        
                                                                        
                                                                        "
            # Print header
            printf "\e[1m%-30s  %-50s\e[0m\n" "Option" "Description"
            echo ""
            # Print options and descriptions
            printf "%-30s : %-50s\n" "-h" "Display this help message."
            printf "%-30s : %-50s\n" "-d <domain.com>" "Provide a single subdomain to test."
            printf "%-30s : %-50s\n" "-l <list-of-domains.txt>" "Provide a file containing a list of subdomains to test."
            printf "%-30s : %-50s\n" "-w <wordlist-of-headers.txt>" "Provide a file containing a list of HTTP headers to use. If not provided, a default set of headers will be used."
            printf "%-30s : %-50s\n" "-f <filter>" "A comma-separated list of status codes to exclude from the output."
            printf "%-30s : %-50s\n" "|tee <output.txt>" "Save output to a file."
            echo ""
            echo "----------------------------------------------------------------------------------------------------------------------------------------------------------------------"
            echo ""
            # Print header
            printf "\e[1m%-30s  %-50s\e[0m\n" "Color" "Status Code"
            echo ""

            # Print options and descriptions
            printf "\e[32m%-30s\e[0m : \e[32m%-50s\n\e[0m" "GREEN" "2xx Status Code"
            printf "\e[34m%-30s\e[0m : \e[34m%-50s\n\e[0m" "BLUE" "3xx Status Code"
            printf "\e[33m%-30s\e[0m : \e[33m%-50s\n\e[0m" "YELLOW" "4xx Status Code"
            printf "\e[31m%-30s\e[0m : \e[31m%-50s\n\e[0m" "RED" "5xx Status Code"

            exit 1
    esac
done
echo -e "\e[31m
                 _   _               _        _                    _           
                | | | |             | |      | |                  | |          
\e[32m  _ __ ___   ___| |_| |__   ___   __| |______| |__   ___  __ _  __| | ___ _ __ 
\e[33m | '_ '  _ \/ _ \ __| '_ \ / _ \ / _  |______| '_ \ / _ \/ _  |/ _  |/ _ \ '__|
\e[34m | | | | | |  __/ |_| | | | (_) | (_| |      | | | |  __/ (_| | (_| |  __/ |\e[0m  
\e[35m |_| |_| |_|\___|\__|_| |_|\___/ \__,_|      |_| |_|\___|\__ _|\__,_|\___|_|   
                                                                               
                                                                        \e[37m𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠\e[0m
                                                                        
                                                                        
                                                                        
                                                                        "
# List of common HTTP methods
methods=("ACL"
"ARBITRARY"
"BASELINE-CONTROL"
"CHECKIN"
"CHECKOUT"
"CONNECT"
"COPY"
"DELETE"
"GET"
"HACK"
"INVENTED"
"LABEL"
"LOCK"
"MERGE"
"MKACTIVITY"
"MKCOL"
"MKWORKSPACE"
"MOVE"
"OPTIONS"
"ORDERPATCH"
"PATCH"
"POST"
"PROPFIND"
"PROPPATCH"
"PUT"
"REPORT"
"SEARCH"
"TRACE"
"UNCHECKOUT"
"UNLOCK"
"UPDATE"
"VERSION-CONTROL"
"HEAD"
"FOO"
)

if [ ! -z "$subdomains_file" ]
then
    mapfile -t subdomains < $subdomains_file
elif [ ! -z "$subdomain" ]
then
    subdomains=($subdomain)
else
    echo "Please provide either a single subdomain with the -d flag or a file containing subdomains with the -l flag."
    exit 1
fi

if [ ! -z "$headers_file" ]
then
    mapfile -t headers < $headers_file
else
    headers=(
        "Client-IP: 0"
"Client-IP: 0177.0000.0000.0001"
"Client-IP: 0x7F000001"
"Client-IP: 10.0.0.0"
"Client-IP: 10.0.0.1"
"Client-IP: 127.0.0.1"
"Client-IP: 127.0.0.1:443"
"Client-IP: 127.0.0.1:80"
"Client-IP: 127.1"
"Client-IP: 172.16.0.0"
"Client-IP: 172.16.0.1"
"Client-IP: 192.168.1.0"
"Client-IP: 192.168.1.1"
"Client-IP: 2130706433"
"Client-IP: localhost"
"Client-IP: localhost:443"
"Client-IP: localhost:80"
"Cluster-Client-IP: 0"
"Cluster-Client-IP: 0177.0000.0000.0001"
"Cluster-Client-IP: 0x7F000001"
"Cluster-Client-IP: 10.0.0.0"
"Cluster-Client-IP: 10.0.0.1"
"Cluster-Client-IP: 127.0.0.1"
"Cluster-Client-IP: 127.0.0.1:443"
"Cluster-Client-IP: 127.0.0.1:80"
"Cluster-Client-IP: 127.1"
"Cluster-Client-IP: 172.16.0.0"
"Cluster-Client-IP: 172.16.0.1"
"Cluster-Client-IP: 192.168.1.0"
"Cluster-Client-IP: 192.168.1.1"
"Cluster-Client-IP: 2130706433"
"Cluster-Client-IP: localhost"
"Cluster-Client-IP: localhost:443"
"Cluster-Client-IP: localhost:80"
"Connection: close"
"Connection: X-Bar"
"Connection: X-Foo"
"Content-Length: 0"
"Content-Length:0"
"Forwarded-For: 0"
"Forwarded-For: 0177.0000.0000.0001"
"Forwarded-For: 0x7F000001"
"Forwarded-For: 10.0.0.0"
"Forwarded-For: 10.0.0.1"
"Forwarded-For: 127.0.0.1"
"Forwarded-For: 127.0.0.1:443"
"Forwarded-For: 127.0.0.1:80"
"Forwarded-For: 127.1"
"Forwarded-For: 172.16.0.0"
"Forwarded-For: 172.16.0.1"
"Forwarded-For: 192.168.1.0"
"Forwarded-For: 192.168.1.1"
"Forwarded-For: 2130706433"
"Forwarded-For: localhost"
"Forwarded-For: localhost:443"
"Forwarded-For: localhost:80"
"Host"
"Host: 0"
"Host: 0177.0000.0000.0001"
"Host: 0x7F000001"
"Host: 10.0.0.0"
"Host: 10.0.0.1"
"Host: 127.0.0.1"
"Host: 127.0.0.1:443"
"Host: 127.0.0.1:80"
"Host: 127.1"
"Host: 172.16.0.0"
"Host: 172.16.0.1"
"Host: 192.168.1.0"
"Host: 192.168.1.1"
"Host: 2130706433"
"Host: localhost"
"Host: localhost:443"
"Host: localhost:80"
"Referer: 0"
"Referer: 0177.0000.0000.0001"
"Referer: 0x7F000001"
"Referer: 10.0.0.0"
"Referer: 10.0.0.1"
"Referer: 127.0.0.1"
"Referer: 127.0.0.1:443"
"Referer: 127.0.0.1:80"
"Referer: 127.1"
"Referer: 172.16.0.0"
"Referer: 172.16.0.1"
"Referer: 192.168.1.0"
"Referer: 192.168.1.1"
"Referer: 2130706433"
"Referer: http://localhost/"
"Referer: localhost"
"Referer: localhost:443"
"Referer: localhost:80"
"True-Client-IP: 0"
"True-Client-IP: 0177.0000.0000.0001"
"True-Client-IP: 0x7F000001"
"True-Client-IP: 10.0.0.0"
"True-Client-IP: 10.0.0.1"
"True-Client-IP: 127.0.0.1"
"True-Client-IP: 127.0.0.1:443"
"True-Client-IP: 127.0.0.1:80"
"True-Client-IP: 127.1"
"True-Client-IP: 172.16.0.0"
"True-Client-IP: 172.16.0.1"
"True-Client-IP: 192.168.1.0"
"True-Client-IP: 192.168.1.1"
"True-Client-IP: 2130706433"
"True-Client-IP: localhost"
"True-Client-IP: localhost:443"
"True-Client-IP: localhost:80"
"User-Agent"
"User-Agent: AppleTV6,2/12.0.1"
"User-Agent: Dalvik/2.1.0 (Linux; U; Android 5.1.1; AFTS Build/LVY48F)"
"User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Mobile/15E148 Safari/604.1"
"User-Agent: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36"
"User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5.1 Safari/605."
"User-Agent: Mozilla/5.0 (PlayStation 4 1.70) AppleWebKit/536.26 (KHTML, like Gecko)"
"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537."
"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; Xbox; Xbox One) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10553"
"User-Agent: Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.0 Safari/537.36 CrKey/1.5.16041"
"User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:15.0) Gecko/20100101 Firefox/15."
"User-Agent: Roku4640X/DVP-7.70 (297.70E04154A)"
"X-Custom-IP-Authorization: 0"
"X-Custom-IP-Authorization: 0177.0000.0000.0001"
"X-Custom-IP-Authorization: 0x7F000001"
"X-Custom-IP-Authorization: 10.0.0.0"
"X-Custom-IP-Authorization: 10.0.0.1"
"X-Custom-IP-Authorization: 127.0.0.1"
"X-Custom-IP-Authorization: 127.0.0.1:443"
"X-Custom-IP-Authorization: 127.0.0.1:80"
"X-Custom-IP-Authorization: 127.1"
"X-Custom-IP-Authorization: 172.16.0.0"
"X-Custom-IP-Authorization: 172.16.0.1"
"X-Custom-IP-Authorization: 192.168.1.0"
"X-Custom-IP-Authorization: 192.168.1.1"
"X-Custom-IP-Authorization: 2130706433"
"X-Custom-IP-Authorization: localhost"
"X-Custom-IP-Authorization: localhost:443"
"X-Custom-IP-Authorization: localhost:80"
"X-Forwarded: 0"
"X-Forwarded: 0177.0000.0000.0001"
"X-Forwarded: 0x7F000001"
"X-Forwarded: 10.0.0.0"
"X-Forwarded: 10.0.0.1"
"X-Forwarded: 127.0.0.1"
"X-Forwarded: 127.0.0.1:443"
"X-Forwarded: 127.0.0.1:80"
"X-Forwarded: 127.1"
"X-Forwarded: 172.16.0.0"
"X-Forwarded: 172.16.0.1"
"X-Forwarded: 192.168.1.0"
"X-Forwarded: 192.168.1.1"
"X-Forwarded: 2130706433"
"X-Forwarded-For: 0"
"X-Forwarded-For: 0177.0000.0000.0001"
"X-Forwarded-For: 0x7F000001"
"X-Forwarded-For: 10.0.0.0"
"X-Forwarded-For: 10.0.0.1"
"X-Forwarded-For: 127.0.0.1"
"X-Forwarded-For: 127.0.0.1:443"
"X-Forwarded-For: 127.0.0.1:80"
"X-Forwarded-For: 127.1"
"X-Forwarded-For: 172.16.0.0"
"X-Forwarded-For: 172.16.0.1"
"X-Forwarded-For: 192.168.1.0"
"X-Forwarded-For: 192.168.1.1"
"X-Forwarded-For: 2130706433"
"X-Forwarded-For: localhost"
"X-Forwarded-For: localhost:443"
"X-Forwarded-For: localhost:80"
"X-Forwarded: localhost"
"X-Forwarded: localhost:443"
"X-Forwarded: localhost:80"
"X-Original-URL: 0"
"X-Original-URL: 0177.0000.0000.0001"
"X-Original-URL: 0x7F000001"
"X-Original-URL: 10.0.0.0"
"X-Original-URL: 10.0.0.1"
"X-Original-URL: 127.0.0.1"
"X-Original-URL: 127.0.0.1:443"
"X-Original-URL: 127.0.0.1:80"
"X-Original-URL: 127.1"
"X-Original-URL: 172.16.0.0"
"X-Original-URL: 172.16.0.1"
"X-Original-URL: 192.168.1.0"
"X-Original-URL: 192.168.1.1"
"X-Original-URL: 2130706433"
"X-Original-URL: localhost"
"X-Original-URL: localhost:443"
"X-Original-URL: localhost:80"
"X-Originating-IP: 0"
"X-Originating-IP: 0177.0000.0000.0001"
"X-Originating-IP: 0x7F000001"
"X-Originating-IP: 10.0.0.0"
"X-Originating-IP: 10.0.0.1"
"X-Originating-IP: 127.0.0.1"
"X-Originating-IP: 127.0.0.1:443"
"X-Originating-IP: 127.0.0.1:80"
"X-Originating-IP: 127.1"
"X-Originating-IP: 172.16.0.0"
"X-Originating-IP: 172.16.0.1"
"X-Originating-IP: 192.168.1.0"
"X-Originating-IP: 192.168.1.1"
"X-Originating-IP: 2130706433"
"X-Originating-IP: localhost"
"X-Originating-IP: localhost:443"
"X-Originating-IP: localhost:80"
"X-ProxyUser-Ip: 0"
"X-ProxyUser-Ip: 0177.0000.0000.0001"
"X-ProxyUser-Ip: 0x7F000001"
"X-ProxyUser-Ip: 10.0.0.0"
"X-ProxyUser-Ip: 10.0.0.1"
"X-ProxyUser-Ip: 127.0.0.1"
"X-ProxyUser-Ip: 127.0.0.1:443"
"X-ProxyUser-Ip: 127.0.0.1:80"
"X-ProxyUser-Ip: 127.1"
"X-ProxyUser-Ip: 172.16.0.0"
"X-ProxyUser-Ip: 172.16.0.1"
"X-ProxyUser-Ip: 192.168.1.0"
"X-ProxyUser-Ip: 192.168.1.1"
"X-ProxyUser-Ip: 2130706433"
"X-ProxyUser-Ip: localhost"
"X-ProxyUser-Ip: localhost:443"
"X-ProxyUser-Ip: localhost:80"
"X-Remote-Addr: 0"
"X-Remote-Addr: 0177.0000.0000.0001"
"X-Remote-Addr: 0x7F000001"
"X-Remote-Addr: 10.0.0.0"
"X-Remote-Addr: 10.0.0.1"
"X-Remote-Addr: 127.0.0.1"
"X-Remote-Addr: 127.0.0.1:443"
"X-Remote-Addr: 127.0.0.1:80"
"X-Remote-Addr: 127.1"
"X-Remote-Addr: 172.16.0.0"
"X-Remote-Addr: 172.16.0.1"
"X-Remote-Addr: 192.168.1.0"
"X-Remote-Addr: 192.168.1.1"
"X-Remote-Addr: 2130706433"
"X-Remote-Addr: localhost"
"X-Remote-Addr: localhost:443"
"X-Remote-Addr: localhost:80"
"X-Remote-IP: 0"
"X-Remote-IP: 0177.0000.0000.0001"
"X-Remote-IP: 0x7F000001"
"X-Remote-IP: 10.0.0.0"
"X-Remote-IP: 10.0.0.1"
"X-Remote-IP: 127.0.0.1"
"X-Remote-IP: 127.0.0.1:443"
"X-Remote-IP: 127.0.0.1:80"
"X-Remote-IP: 127.1"
"X-Remote-IP: 172.16.0.0"
"X-Remote-IP: 172.16.0.1"
"X-Remote-IP: 192.168.1.0"
"X-Remote-IP: 192.168.1.1"
"X-Remote-IP: 2130706433"
"X-Remote-IP: localhost"
"X-Remote-IP: localhost:443"
"X-Remote-IP: localhost:80"
"X-Rewrite-URL: 0"
"X-Rewrite-URL: 0177.0000.0000.0001"
"X-Rewrite-URL: 0x7F000001"
"X-Rewrite-URL: 10.0.0.0"
"X-Rewrite-URL: 10.0.0.1"
"X-Rewrite-URL: 127.0.0.1"
"X-Rewrite-URL: 127.0.0.1:443"
"X-Rewrite-URL: 127.0.0.1:80"
"X-Rewrite-URL: 127.1"
"X-Rewrite-URL: 172.16.0.0"
"X-Rewrite-URL: 172.16.0.1"
"X-Rewrite-URL: 192.168.1.0"
"X-Rewrite-URL: 192.168.1.1"
"X-Rewrite-URL: 2130706433"
"X-Rewrite-URL: localhost"
"X-Rewrite-URL: localhost:443"
"X-Rewrite-URL: localhost:80"
"Connection: Close, Accept"
"Connection: Close, Accept-Application"
"Connection: Close, Accept-Charset"
"Connection: Close, Accepted"
"Connection: Close, Accept-Encoding"
"Connection: Close, Accept-Encodxng"
"Connection: Close, Accept-Language"
"Connection: Close, Accept-Ranges"
"Connection: Close, Accept-Version"
"Connection: Close, Access-Control-Allow-Credentials"
"Connection: Close, Access-Control-Allow-Headers"
"Connection: Close, Access-Control-Allow-Methods"
"Connection: Close, Access-Control-Allow-Origin"
"Connection: Close, Access-Control-Expose-Headers"
"X-Forwarded-Port: 443"
"X-Forwarded-Port: 8080"
"X-Forwarded-Port: 454"
)
fi

# List of HTTP versions
http_versions=("1.0" "1.1" "2")

for subdomain in "${subdomains[@]}"
do
    echo -e "\n\e[35m=============================\e[0m\n"
    echo -e "\e[35mTesting subdomain: $subdomain\e[0m\n"
    echo -e "\e[35m=============================\e[0m\n"
    for protocol in http https
    do
        for http_version in "${http_versions[@]}"
        do
            url="${protocol}://${subdomain}"
            echo "--------------------------------------------"
	    echo -e "Testing \e[1m$protocol\e[0m with \e[1mHTTP/$http_version\e[0m-->\e[1m[$url]\e[0m"
	    echo "--------------------------------------------"
            echo ""
            # header of the table
            printf "\e[1m%-6s | %-16s | %-160s\e[0m\n" "Status" "Method" "Header: value"
	        printf "%-6s - %-16s - %-160s\n" "------" "----------------" "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
            for method in "${methods[@]}"
            do
                for header in "${headers[@]}"
                do
                    
                    status_code=$(curl --http$http_version -s -o /dev/null -w "%{http_code}" --max-time 5 -H "$header: Fuzz" -X $method $url)
                    if [ $? -eq 0 ] ; then
                        
                        # If a filter is provided, only display responses with status codes not in the filter.
                        if [[ ! ${filter[*]} =~ ${status_code} ]]; then 
                            case "$status_code" in
                            2??) color="\e[32m";; # Green for 2xx
			                3??) color="\e[34m";; # Blue for 3xx
			                4??) color="\e[33m";; # Yellow for 4xx
			                5??) color="\e[31m";; # Red for 5xx
			                *)   color="\e[37m";; # Default to white for any other status codes
                            esac
                        
                            printf "${color}%-6s\e[0m | ${color}%-16s\e[0m | ${color}%-160s\e[0m\n" "$status_code" "$method" "$header"
                        fi
                    fi
                done
            done
        done
    done
done
