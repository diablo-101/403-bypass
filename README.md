# 403-bypass

Are you interested in web security and want to test your skills against potential 403 bypasses? If so, you've come to the right place! This project is a comprehensive suite of Bash scripts, meticulously designed for the purpose of probing 403 bypasses in web security. Whether you're a beginner or an expert, this tool will help you discover new ways to bypass 403 errors and access restricted resources.

<h1>Features</h1>
<ul>
    <li>
        This tool offers four different scripts, each with its own unique functionality and options.
    </li>
</ul>
<ol type="1">
    <li><h3>method-header.sh</h3>
        <ul>
            <li>
                You can use <code>method-header.sh</code> to test different HTTP methods, headers, HTTP protocol and HTTP versions work together against the target URL.
            </li>
            <li>
                The script also includes a set of default values for these headers. You can add your own headers and values using the <code>-w</code> option, like this <code>./method-header.sh -d domain.com -w header: value</code>
            </li>
        </ul>
        <ol type="a">
            <li>
                <h4>HTTP Method</h4>
                <p>The script supports a wide range of HTTP methods:</p>
                <ol type="I">
                    <li>
                        Standard methods: GET, POST, PUT, DELETE, OPTIONS, HEAD
                    </li>
                    <li>
                        WebDAV methods: COPY, LOCK, MKCOL, MOVE, PROPFIND, PROPPATCH, UNLOCK
                    </li>
                    <li>
                        Versioning methods: CHECKIN, CHECKOUT, LABEL, MERGE, REPORT, UPDATE
                    </li>
                    <li>
                        Others: ACL, BASELINE-CONTROL, CONNECT, MKACTIVITY, MKWORKSPACE, ORDERPATCH, PATCH, SEARCH, TRACE, UNCHECKOUT, ARBITRARY, HACK, INVENTED, VERSION-CONTROL,FOO
                    </li>
                </ol>
            </li>
            <li>
                <h4>HTTP Headers</h4>
                <p>The script includes a set of default headers and values that are commonly used in HTTP requests:</p>
                <ol type="I">
                    <li>
                        <h5>Default Headers</h5>
                        <ul>
                            <li>Client-IP</li>
                            <li>Cluster-Client-IP</li>
                            <li>Connection</li>
                            <li>Content-Length</li>
                            <li>Forwarded-For</li>
                            <li>Host</li>
                            <li>Referer</li>
                            <li>True-Client-IP</li>
                            <li>User-Agent</li>
                            <li>X-Custom-IP-Authorization</li>
                            <li>X-Forwarded</li>
                            <li>X-Forwarded-For</li>
                            <li>X-Forwarded-Port</li>
                            <li>X-Original-URL</li>
                            <li>X-Originating-IP</li>
                            <li>X-ProxyUser-Ip</li>
                            <li>X-Remote-Addr</li>
                            <li>X-Remote-IP</li>
                            <li>X-Rewrite-URL</li>
                        </ul>
                    </li>
                    <li>
                        <h5>Default values</h5>
                        <ul>
                            <li>0</li>
                            <li>0177.0000.0000.0001</li>
                            <li>0x7F000001</li>
                            <li>10.0.0.0</li>
                            <li>10.0.0.1</li>
                            <li>127.0.0.1</li>
                            <li>127.0.0.1:443</li>
                            <li>127.0.0.1:80</li>
                            <li>127.1</li>
                            <li>172.16.0.0</li>
                            <li>172.16.0.1</li>
                            <li>192.168.1.0</li>
                            <li>192.168.1.1</li>
                            <li>2130706433</li>
                            <li>443</li>
                            <li>454</li>
                            <li>8080</li>
                            <li>close</li>
                            <li>Close, Accept</li>
                            <li>Close, Accept-Application</li>
                            <li>Close, Accept-Charset</li>
                            <li>Close, Accepted</li>
                            <li>Close, Accept-Encoding</li>
                            <li>Close, Accept-Encodxng</li>
                            <li>Close, Accept-Language</li>
                            <li>Close, Accept-Ranges</li>
                            <li>Close, Accept-Version</li>
                            <li>Close, Access-Control-Allow-Credentials</li>
                            <li>Close, Access-Control-Allow-Headers</li>
                            <li>Close, Access-Control-Allow-Methods</li>
                            <li>Close, Access-Control-Allow-Origin</li>
                            <li>Close, Access-Control-Expose-Headers</li>
                            <li>http://localhost/</li>
                            <li>localhost</li>
                            <li>localhost:443</li>
                            <li>localhost:80</li>
                            <li>X-Bar</li>
                            <li>X-FOO</li>
                            <li>User Agent Values: 
                                <ol type="i">
                                    <li>operating system:
                                        <ul>
                                            <li>Android: Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36</li>
                                            <li>iOS (iPhone): Mozilla/5.0 (iPhone; CPU iPhone OS 13_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.5 Mobile/15E148 Safari/604.1</li>
                                            <li>Windows: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.</li>
                                            <li>Mac OS X: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5.1 Safari/605.</li>
                                            <li>Linux: Mozilla/5.0 (X11; Linux x86_64; rv:15.0) Gecko/20100101 Firefox/15.</li>
                                        </ul>
                                    </li>
                                    <li>game play:
                                        <ul>
                                            <li>PlayStation: Mozilla/5.0 (PlayStation 4 1.70) AppleWebKit/536.26 (KHTML, like Gecko)</li>
                                            <li>Xbox: Mozilla/5.0 (Windows NT 10.0; Win64; x64; Xbox; Xbox One) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10553</li>
                                        </ul>
                                    </li>
                                    <li>IOT:
                                        <ul>
                                            <li>Apple TV: AppleTV6,2/12.0.1</li>
                                            <li>Amazon Fire TV: Dalvik/2.1.0 (Linux; U; Android 5.1.1; AFTS Build/LVY48F)</li>
                                            <li>Roku Ultra: Roku4640X/DVP-7.70 (297.70E04154A)</li>
                                            <li>Google Chromecast: Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.0 Safari/537.36 CrKey/1.5.16041</li>
                                        </ul>
                                    </li>
                                </ol>
                            </li>
                            </ul>
                    </li>
                </ol>
            </li>
            <li><h4>HTTP Protocols</h4>
                <ul>
                    <li>
                        The script supports both HTTP and HTTPS protocols.
                    </li>
                </ul>
            </li>
            <li><h4>HTTP Versions</h4>
                <ul>
                    <li>
                        The script supports HTTP versions 1.0, 1.1, and 2.
                    </li>
                </ul>
            </li>
        </ol>
    </li>
    <li><h3>headers.sh</h3>
        <ul>
            <li>
                You can use <code>headers.sh</code> to fuzz various headers with different values against a target URL.
            </li>
            <li>
                The script also includes a set of default values for these headers. You can add your own headers and values using the <code>-w</code> option, like this <code>./header.sh -d domain.com -w header: value</code>
            </li>
                        <p><br>Default Headers:</p>
                <ul>
                    <li>X-Originating-IP: 127.0.0.1</li>
                    <li>X-Forwarded-For: 127.0.0.1</li>
                    <li>X-Forwarded: 127.0.0.1</li>
                    <li>Forwarded-For: 127.0.0.1</li>
                    <li>X-Remote-IP: 127.0.0.1</li>
                    <li>X-Remote-Addr: 127.0.0.1</li>
                    <li>X-ProxyUser-Ip: 127.0.0.1</li>
                    <li>X-Original-URL: 127.0.0.1</li>
                    <li>Client-IP: 127.0.0.1</li>
                    <li>True-Client-IP: 127.0.0.1</li>
                    <li>Cluster-Client-IP: 127.0.0.1</li>
                    <li>Host: localhost</li>
                </ul>
        </ul>
    </li>
    <li><h3>user-agent-fuzz.sh</h3>
        <ul>
            <li>
                You can use <code>user-agent-fuzz.sh</code> to fuzz the user-agent header with different values against a target URL.
            </li>
            <li>
                It does not have a default User Agent list. You can add your own list using the <code>-w</code> option, like this <code>./user-agent-fuzz.sh -u https://domain.com -w list.txt</code>
            </li>
        </ul>
    </li>
    <li><h3>methods.sh</h3>
        <ul>
            <li>
                You can use <code>methods.sh</code> to test different HTTP methods against a target URL.
            </li>
                        <li>
                The script also includes a set of default methods. You can add your own methods using the <code>-w</code> option, like this <code>./method.sh -d domain.com -w METHOD</code>
            </li>
            <p><br>Default Method:</p>
            <ul>
  <li>GET</li>
  <li>POST</li>
  <li>PUT</li>
  <li>DELETE</li>
  <li>TRACE</li>
  <li>OPTIONS</li>
  <li>PATCH</li>
</ul>
        </ul>
    </li>
</ol>

For an in-depth understanding of the features offered by this tool, I invite you to visit my Medium website. The link provided will guide you to a wealth of information tailored to enhance your user experience and broaden your knowledge about the tool's capabilities. Your journey to mastery begins with a single [Click](https://medium.com/@diablo1/bypassing-403-forbidden-a-guide-for-cybersecurity-professionals-7b2225991595).

# Installation

To install this tool, simply follow these steps:

   * ```
     git clone https://github.com/diiablo00/403-bypass
     ```
   * ```
     cd 403-bypass
     ```
   * ```
     chmod +x *.sh
     ```

# Usage

To use this tool, simply run the desired script with the appropriate options. For example:

* ```
  ./method-header.sh -h
  ```
* ```
  ./headers.sh -h
  ```
* ```
  ./user-agent-fuzz.sh -h
  ```
* ```
  ./methods.sh -h
  ```

You can also view the help menu of each script by using the `-h` option.

# Demo

Here is a screenshots of each tool:

`./method-header.sh -h`
![Screenshot_2023-10-05_03_49_59](https://github.com/diiablo00/403-bypass/assets/140319882/bfd304a4-3964-44ab-b12a-d3d7c9f1963f)

`./method-header.sh -d www.google.com`
![Screenshot_2023-10-05_03_51_24](https://github.com/diiablo00/403-bypass/assets/140319882/3ecaf856-5941-41ac-b004-5faf39049081)

`./headers.sh -h`
![Screenshot_2023-10-05_03_56_13](https://github.com/diiablo00/403-bypass/assets/140319882/0357f9ba-ab02-4397-8165-e65891d66248)

`./headers.sh -d www.google.com`
![Screenshot_2023-10-05_03_56_37](https://github.com/diiablo00/403-bypass/assets/140319882/a1f2e501-2744-4035-a68e-506c41667992)

`./user-agent-fuzz.sh -h`
![Screenshot_2023-10-05_03_57_52](https://github.com/diiablo00/403-bypass/assets/140319882/f11eea14-1b13-4fe5-b06c-8318d63f454d)

`./user-agent-fuzz.sh -u https://www.google.com -w list.txt`
![Screenshot_2023-10-05_03_58_35](https://github.com/diiablo00/403-bypass/assets/140319882/d906b0a1-1684-4216-8442-c4dc026f22b9)

`./methods.sh -h`
![Screenshot_2023-10-05_03_54_44](https://github.com/diiablo00/403-bypass/assets/140319882/e500f0e6-15cc-4e8b-8601-1198893b4416)

`./methods.sh -d www.google.com`
![Screenshot_2023-10-05_03_55_05](https://github.com/diiablo00/403-bypass/assets/140319882/0254666b-fd7e-4ec7-ab0e-912d1e0c6de2)

# Contribution

If you want to contribute to this project, feel free to fork it and submit a pull request. You can also report any issues or suggestions on the [Issues](https://github.com/diiablo00/403-bypass/issues) page.

# Contact

If you have any questions or feedback, you can follow me on
- Twitter: [diablo0_diablo](https://twitter.com/diablo0_diablo)
- Instagram: [diablo0_diablo](https://www.instagram.com/diablo0_diablo/)
   I'd love to hear from you!

# Articles

For further reading and understanding, here are some articles that provide more insights into bypassing 403 protections:

- [Bypassing 403 Protection To Get Pagespeed Admin Access](https://sapt.medium.com/bypassing-403-protection-to-get-pagespeed-admin-access-822fab64c0b3)
- [Bypassing Multiple 403 Response Type Pages](https://medium.com/@Dhamuharker/bypassing-403-response-type-pages-f2f37975ae29)
- [New technique 403 bypass lyncdiscover.microsoft.com](https://infosecwriteups.com/403-bypass-lyncdiscover-microsoft-com-db2778458c33)
- [How I bypassed 403 forbidden domain using a simple trick](https://systemweakness.com/how-i-bypassed-403-forbidden-domain-using-a-simple-trick-c2d538de04b8)
- [How to bypass 403 forbidden bypass](https://security-sphinx.medium.com/how-to-bypass-403-forbidden-bypass-2330acc69069)
- [How 403 Forbidden Bypass got me NOKIA Hall Of Fame (HOF)](https://infosecwriteups.com/how-403-forbidden-bypass-got-me-nokia-hall-of-fame-hof-8acbd2c1c2c8)
- [403 forbidden bypass leads to HALL OF FAME](https://infosecwriteups.com/403-forbidden-bypass-leads-to-hall-of-fame-ff61ccd0a71e)

These articles provide valuable insights and practical examples of bypassing 403 protections. They can be a great resource for anyone interested in web security.

Remember, always stay updated and keep learning!
