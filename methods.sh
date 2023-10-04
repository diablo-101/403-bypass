#!/bin/bash
echo -e "\033[31m
                 _   _               _ 
                | | | |             | |
  \033[32m_ __ ___   ___| |_| |__   ___   __| |
 | '_   _ \ / _ \ __| '_ \ / _ \ / _  |
 | | | | | |  __/ |_| | | | (_) | (_| |\033[0m
\033[37m |_| |_| |_|\___|\__|_| |_|\___/ \__,_|
   
                                    𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠\033[0m
                                    
                                    
                                    
                                    
                                    "

colorize() {
    if [ $1 -eq 404 ]; then
        echo -e "\e[33m$2\e[0m"  # Yellow for 4xx status codes
    elif [ $1 -ge 200 -a $1 -lt 300 ]; then
        echo -e "\e[32m$2\e[0m"  # Green for 2xx status codes
    elif [ $1 -ge 300 -a $1 -lt 400 ]; then
        echo -e "\e[34m$2\e[0m"  # Blue for 3xx status codes
    elif [ $1 -ge 400 -a $1 -lt 500 ]; then
        echo -e "\e[33m$2\e[0m"  # Yellow for 4xx status codes
    elif [ $1 -ge 500 ]; then
        echo -e "\e[31m$2\e[0m"  # Red for 5xx status codes
    else
        echo $2
    fi
}

send_requests() {
    domain=$1

    echo -e "\n\e[35m=============================\e[0m\n"
    echo -e "\e[35mTesting subdomain: $subdomain\e[0m\n"
    echo -e "\e[35m=============================\e[0m\n"

    protocol="HTTP"
    
    echo "--------------------------------------------------"
    echo -e "Testing \e[1m$protocol\e[0m \e[0m-->\e[1m[$domain]\e[0m"
    echo "--------------------------------------------------"
    echo ""
    printf "\e[1m%-6s | %-160s\e[0m\n" "Status" "Method"
    printf "%-6s - %-160s\n" "------" "------"
    
    for method in "${methods[@]}"
    do
        status_code=$(curl -o /dev/null -s -w "%{http_code}" -X $method http://$domain)
        colored_status_code=$(colorize $status_code $status_code)
        colored_method=$(colorize $status_code $method)

        if [[ ! ${filter[*]} =~ ${status_code} ]]; then 
            printf "%-15s\e[0m | %-160s\e[0m\n" "${colored_status_code}" " ${colored_method} "
        fi
    done

    protocol="HTTPS"

    echo ""
    echo "--------------------------------------------------"
    echo -e "Testing \e[1m$protocol\e[0m \e[0m-->\e[1m[$domain]\e[0m"
    echo "--------------------------------------------------"
    echo ""
    printf "\e[1m%-6s | %-160s\e[0m\n" "Status" "Method"
    printf "%-6s - %-160s\n" "------" "------"
    
    for method in "${methods[@]}"
    do
        status_code=$(curl -o /dev/null -s -w "%{http_code}" -X $method https://$domain)
        colored_status_code=$(colorize $status_code $status_code)
        colored_method=$(colorize $status_code $method)

        if [[ ! ${filter[*]} =~ ${status_code} ]]; then 
            printf "%-15s\e[0m | %-160s\e[0m\n" "${colored_status_code}" " ${colored_method} "
        fi
    done

}

methods=("GET" "POST" "PUT" "DELETE" "TRACE" "OPTIONS" "PATCH")

if [ "$#" == 0 ]; then
   echo -e "\033[31m
                 _   _               _ 
                | | | |             | |
  _ __ ___   ___| |_| |__   ___   __| |
 | '_   _ \ / _ \ __| '_ \ / _ \ / _  |
 | | | | | |  __/ |_| | | | (_) | (_| |
 |_| |_| |_|\___|\__|_| |_|\___/ \__,_|
   
                                    𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠
   
   
   
   Please provide arguments. Use -h to know how to use this tool.\033[0m"
   exit 1 
elif [ "$1" == "-h" ]; then
echo -e "\033[31m
                 _   _               _ 
                | | | |             | |
  \033[32m_ __ ___   ___| |_| |__   ___   __| |
 | '_   _ \ / _ \ __| '_ \ / _ \ / _  |
 | | | | | |  __/ |_| | | | (_) | (_| |\033[0m
\033[37m |_| |_| |_|\___|\__|_| |_|\___/ \__,_|
   
                                    𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠\033[0m"
echo "


"
   echo -e "\033[1mUsage:\033[0m $0 [-d <domain> | -l <domainlist>] [-w <wordlist>] [-f <filter>]"
echo "Sends HTTP requests with different methods to the specified domain (both HTTP and HTTPS) and displays the status code of the response."
echo ""
printf "\e[1m%-30s  %-50s\e[0m\n" "Option" "Description"
            echo ""
printf "%-30s : %-50s\n" "-h" "Display this help message."
printf "%-30s : %-50s\n" "-d <domain>" "The target domain to send requests to."
printf "%-30s : %-50s\n" "-l <domainlist>" "A file containing a list of domains. The script will send requests to each domain in the list."
printf "%-30s : %-50s\n" "-w <wordlist>" "A file containing a list of HTTP methods to use. If you do not type any list, the script will use its default list."
printf "%-30s : %-50s\n" "-f <filter>" "A comma-separated list of status codes to exclude from the output."
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
elif [ "$1" == "-d" ]; then
   if [ "$3" == "-w" ]; then
        methods=()
        while IFS= read -r line; do
            methods+=("$line")
        done < "$4"
    fi
    if [ "$3" == "-f" ] || [ "$5" == "-f" ]; then
        IFS=',' read -ra filter <<< "${!#}"
    fi
   send_requests $2 
elif [ "$1" == "-l" ]; then
   if [ ! -s "$2" ]; then 
       echo "File does not exist or is empty."
       exit 1 
   fi

   if [ "$3" == "-w" ]; then
        methods=()
        while IFS= read -r line; do
            methods+=("$line")
        done < "$4"
    fi

    if [ "$3" == "-f" ] || [ "$5" == "-f" ]; then
        IFS=',' read -ra filter <<< "${!#}"
    fi

   while IFS= read -r line || [[ -n "$line" ]]; do 
       send_requests $line 
   done < "$2"
   exit 1 
fi
