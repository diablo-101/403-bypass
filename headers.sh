#!/bin/bash

if [ $# -eq 0 ]
then
    echo -e "\e[31m
  _                    _           
 | |                  | |          
 | |__   ___  __ _  __| | ___ _ __ 
 | '_ \ / _ \/ _  |/ _  |/ _ \ '__|
 | | | |  __/ (_| | (_| |  __/ |   
 |_| |_|\___|\__,_|\__ _|\___|_|   
                                              
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
        h) echo -e "\e[31m
  _                    _           
 | |                  | |          
\e[32m | |__   ___  __ _  __| | ___ _ __ 
 | '_ \ / _ \/ _  |/ _  |/ _ \ '__|
\e[33m | | | |  __/ (_| | (_| |  __/ |   
 |_| |_|\___|\__,_|\__ _|\___|_|   
\e[0m
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
             exit 1;;
    esac
done
echo -e "\e[31m
  _                    _           
 | |                  | |          
\e[32m | |__   ___  __ _  __| | ___ _ __ 
 | '_ \ / _ \/ _  |/ _  |/ _ \ '__|
\e[33m | | | |  __/ (_| | (_| |  __/ |   
 |_| |_|\___|\__,_|\__ _|\___|_|   
\e[0m
                          \e[37m𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠\e[0m
                          
                          
                          "
if [ -z "$headers_file" ]
then
    headers=(
"X-Originating-IP: 127.0.0.1"
"X-Forwarded-For: 127.0.0.1"
"X-Forwarded: 127.0.0.1"
"Forwarded-For: 127.0.0.1"
"X-Remote-IP: 127.0.0.1"
"X-Remote-Addr: 127.0.0.1"
"X-ProxyUser-Ip: 127.0.0.1"
"X-Original-URL: 127.0.0.1"
"Client-IP: 127.0.0.1"
"True-Client-IP: 127.0.0.1"
"Cluster-Client-IP: 127.0.0.1"
"X-ProxyUser-Ip: 127.0.0.1"
"Host: localhost")
else
    mapfile -t headers < $headers_file
fi

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

for subdomain in "${subdomains[@]}"
do
    echo -e "\n\e[35m=============================\e[0m\n"
    echo -e "\e[35mTesting subdomain: $subdomain\e[0m\n"
    echo -e "\e[35m=============================\e[0m\n"
    for protocol in http https
    do
        url="${protocol}://${subdomain}"
        echo "-----------------------------------"
	echo -e "Testing \e[1m$protocol\e[0m \e[0m-->\e[1m[$url]\e[0m"
	echo "-----------------------------------"
	echo ""
	printf "\e[1m%-6s | %-160s\e[0m\n" "Status" "Header: value"
	printf "%-6s - %-160s\n" "------" "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
        for header in "${headers[@]}"
        do
            
            status_code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 -H "$header: Fuzz" -X GET $url)
            if [ $? -eq 0 ] ; then
                
                # If a filter is provided, only display responses with status codes not in the filter. If no filter is provided, display all responses.
                if [[ ! ${filter[*]} =~ ${status_code} ]]; then 
                    case "$status_code" in
                    2??) color="\e[32m";; # Green for 2xx
                    3??) color="\e[34m";; # Blue for 3xx
		    4??) color="\e[33m";; # Yellow for 4xx
		    5??) color="\e[31m";; # Red for 5xx
		    *)   color="\e[37m";; # Default to white for any other status codes
                    esac
                
                    printf "${color}%-6s\e[0m | ${color}%-160s\e[0m\n" "$status_code" " $header"

                    #echo -n "Trying header $header on $url: "

                fi
                
            else
                echo "Request failed"
            fi
            
        done
        
        echo -e "\n\e[34m-----------------------------\e[0m\n"
        
    done
    
done

#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Please provide arguments. Use -h to know how to use this tool."
    exit 1
fi

while getopts l:w:d:f:h flag
do
    case "${flag}" in
        l) subdomains_file=${OPTARG};;
        w) headers_file=${OPTARG};;
        d) subdomain=${OPTARG};;
        f) IFS=',' read -ra filter <<< "${OPTARG}";;
        h) echo -e "Usage: ./filename.sh -d <subdomain> -l <subdomains.txt> -w <headers.txt> -f <filter>\n\nOptions:\n  -d <subdomain>: Provide a single subdomain to test.\n  -l <subdomains.txt>: Provide a file containing a list of subdomains to test.\n  -w <headers.txt>: Provide a file containing a list of HTTP headers to use. If not provided, a default set of headers will be used.\n  -f <filter>: A comma-separated list of status codes to exclude from the output.\n  -h: Display this help message."; exit 1;;
    esac
done

if [ -z "$headers_file" ]
then
    headers=("User-Agent" "Referer" "Accept" "Accept-Language" "Accept-Encoding" "Host: localhost")
else
    mapfile -t headers < $headers_file
fi

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

for subdomain in "${subdomains[@]}"
do
    echo -e "\n\e[35m=============================\e[0m\n"
    echo -e "\e[35mTesting subdomain: $subdomain\e[0m\n"
    echo -e "\e[35m=============================\e[0m\n"
    for protocol in http https
    do
        url="${protocol}://${subdomain}"
        echo -e "\n\e[34mTesting $protocol...\e[0m\n"
        for header in "${headers[@]}"
        do
            
            status_code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 -H "$header: Fuzz" -X GET $url)
            if [ $? -eq 0 ] ; then
                
                # If a filter is provided, only display responses with status codes not in the filter. If no filter is provided, display all responses.
                if [[ ! ${filter[*]} =~ ${status_code} ]]; then 
                    echo -n "Trying header $header on $url: "
                    case "$status_code" in
                    200) color="\e[32m";; # Green for 200
                    404) color="\e[31m";; # Red for 404
                    *)   color="\e[33m";; # Yellow for anything else
                    esac
                
                    echo -e "${color}[$status_code]\e[0m"
                fi
                
            else
                echo "Request failed"
            fi
            
        done
        
        echo -e "\n\e[34m-----------------------------\e[0m\n"
        
    done
    
done

