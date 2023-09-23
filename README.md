# 403-bypass
- This is a bash script for testing potential 403 bypasses in web security by sending various payloads and headers to a domain or list of subdomains.
# Features
- This bash script is designed to test for 403 bypasses on a domain or a list of subdomains. It sends GET requests with various payloads and headers, and prints the requested URL along with the status code. If a 403 error is bypassed, it could indicate a potential security vulnerability.
# Installation
   * `git clone https://github.com/diiablo00/status-code`
   * `cd status-code`
   * `chmod +x status-code.sh`
   * `./status-code.sh -h`
# Usage
`./script.sh -d example.com -o output.txt`
