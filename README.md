# 403-bypass

Are you interested in web security and want to test your skills against potential 403 bypasses? If so, you've come to the right place! This project is a comprehensive suite of Bash scripts, meticulously designed for the purpose of probing 403 bypasses in web security. Whether you're a beginner or an expert, this tool will help you discover new ways to bypass 403 errors and access restricted resources.

# Features

- This tool offers four different scripts, each with its own unique functionality and options.
- You can use `method-header.sh` to test different HTTP methods, headers, HTTP protocol and HTTP versions work together against the target URL.
- You can use `headers.sh` to fuzz various headers with different values against a target URL.
- You can use `user-agent-fuzz.sh` to fuzz the user-agent header with different values against a target URL.
- You can use `methods.sh` to test different HTTP methods against a target URL.
- For an in-depth understanding of the features offered by this tool, I invite you to visit my Medium website. The link provided will guide you to a wealth of information tailored to enhance your user experience and broaden your knowledge about the tool's capabilities. Your journey to mastery begins with a single [Click](https://medium.com/@diablo1/bypassing-403-forbidden-a-guide-for-cybersecurity-professionals-7b2225991595).

# Installation

To install this tool, simply follow these steps:

   * `git clone https://github.com/diiablo00/403-bypass`
   * `cd 403-bypass`
   * `chmod +x *.sh`

# Usage

To use this tool, simply run the desired script with the appropriate options. For example:

* `./method-header.sh -h`
* `./headers.sh -h`
* `./user-agent-fuzz.sh -h`
* `./methods.sh -h`

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
