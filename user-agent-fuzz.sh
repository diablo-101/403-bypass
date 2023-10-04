#!/bin/bash

# Default array of user agents
default_user_agents=("Mozilla/5.0 (PlayStation 4 1.70) AppleWebKit/536.26 (KHTML, like Gecko)")

# Help function
help() {
echo -e "\033[34m
  _    _                                          _    
 | |  | |                   /\                   | |   
 | |  | |___  ___ _ __     /  \   __ _  ___ _ __ | |_  
 | |  | / __|/ _ \ '__|   / /\ \ / _  |/ _ \ '_ \| __| 
 | |__| \__ \  __/ |     / ____ \ (_| |  __/ | | | |_  
  \____/|___/\___|_|    /_/    \_\__, |\___|_| |_|\__| 
                                  __/ |                
                                 |___/    \033[0m             "
    
    echo "                                             𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠
    
    
    
    "
    echo "Usage: ./test.sh -u [url] -w [file]"
    echo
    echo
    echo "Options:"
    echo "-h : Display this help page."
    echo "-u [url] : Specify the URL to send the GET request to. This option is required."
    echo "-w [file] : Specify a file containing user agents. Each user agent should be on a new line. If this option is not provided, a default list of user agents will be used.(This list is there to test the script)"
    exit 1
}

# Initialize variables
url=""
file=""

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "$(tput setaf 1)
  _    _                                          _    
 | |  | |                   /\                   | |   
 | |  | |___  ___ _ __     /  \   __ _  ___ _ __ | |_  
 | |  | / __|/ _ \ '__|   / /\ \ / _  |/ _ \ '_ \| __| 
 | |__| \__ \  __/ |     / ____ \ (_| |  __/ | | | |_  
  \____/|___/\___|_|    /_/    \_\__, |\___|_| |_|\__| 
                                  __/ |                
                                 |___/                 
                                           𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠
                                           
    
    Please provide arguments. Use -h to know how to use this tool.
    
    $(tput sgr0)"
    exit 1
fi

# Parse options
while getopts ":u:w:h" opt; do
  case ${opt} in
    u )
      url=$OPTARG
      ;;
    w )
      file=$OPTARG
      ;;
    h )
      help
      ;;
    \? )
      echo "Invalid option: -$OPTARG" >&2
      help
      ;;
    : )
      echo "Option -$OPTARG requires an argument." >&2
      help
      ;;
  esac
done
echo -e "\033[34m
  _    _                                          _    
 | |  | |                   /\                   | |   
 | |  | |___  ___ _ __     /  \   __ _  ___ _ __ | |_  
 | |  | / __|/ _ \ '__|   / /\ \ / _  |/ _ \ '_ \| __| 
 | |__| \__ \  __/ |     / ____ \ (_| |  __/ | | | |_  
  \____/|___/\___|_|    /_/    \_\__, |\___|_| |_|\__| 
                                  __/ |                
                                 |___/    \033[0m             "
    
    echo "                                             𝕓𝕪 𝕕𝕚𝕒𝕓𝕝𝕠
    
    
    
    "
# Check if URL is provided
if [[ -z "$url" ]]; then
    echo "No URL provided."
    help
fi

# Check if file is provided and read user agents from file, otherwise use default list
if [[ -n "$file" ]]; then
    mapfile -t user_agents < "$file"
else
    user_agents=("${default_user_agents[@]}")
fi

# Print table header in bold using tput setaf (set foreground color) and tput bold (set bold mode)
printf "$(tput setaf 2; tput bold) %-6s | %-10s $(tput sgr0)\n" "Status"  "User Agent"
printf ' %6s | %10s \n' "------"  "$(printf '%.0s-' {1..20})"

# Loop over each user agent and send GET request to the URL, then print the HTTP status code and the user agent used.
for user_agent in "${user_agents[@]}"; do
    status_code=$(curl -s -o /dev/null -w "%{http_code}" -A "$user_agent" "$url")
    
    # Determine color based on status code
    case ${status_code:0:1} in
        2)
            color=$(tput setaf 2) # Green for 2xx status codes
            ;;
        3)
            color=$(tput setaf 4) # Blue for 3xx status codes
            ;;
        4)
            color=$(tput setaf 3) # Yellow for 4xx status codes
            ;;
        5)
            color=$(tput setaf 1) # Red for 5xx status codes
            ;;
        *)
            color=$(tput sgr0) # Reset color for other status codes
            ;;
    esac
    
    printf ' %s%-6s%s | %-10s \n' "$color" "$status_code" "$(tput sgr0)" "$user_agent"
done

