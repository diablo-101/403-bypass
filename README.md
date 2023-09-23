# 403-bypass
- This is a bash script for testing potential 403 bypasses in web security by sending various payloads and headers to a domain or list of subdomains.
  ![403-pybass](https://github.com/diiablo00/403-bypass/assets/140319882/59e779e9-0f53-4e40-89c5-230d98fa1774)
# Features
- This bash script is designed to test for 403 bypasses on a domain or a list of subdomains. It sends GET requests with various payloads and headers, and prints the requested URL along with the status code. If a 403 error is bypassed, it could indicate a potential security vulnerability.
# Installation
   * `git clone https://github.com/diiablo00/status-code`
   * `cd status-code`
   * `chmod +x status-code.sh`
   * `./status-code.sh -h`
# Usage
`./script.sh -d example.com -o output.txt`


- `-d` option: This is used to specify a single domain to test. For example, if you want to test the domain example.com, you would use the command `./script.sh -d example.com`

- `-l` option: This is used to specify an input file containing subdomains to test. For example, if you have a file named subdomains.txt with one subdomain per line, you would use the command `./script.sh -l subdomains.txt`

- Remember, you can combine these options as needed. For instance, if you want to test a single domain and save the results to a file, you could use `./script.sh -d example.com -o output.txt`
