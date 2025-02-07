# Module 1 


## how to interact with the (bash) terminal 

Execute docker, python, etc from the terminal. 

Download online data directly into your working directory with 
<bash>wget {URL}</bash>

## Python Learnings

New libraries:
- argparse


argparse:
included in the python standard library to handle command line arguments passed 

## Terminal commands

Both curl and wget are command-line tools used for downloading files from the web, but they have key differences in functionality and use cases:

curl (Client URL):
- A data transfer tool that supports a variety of protocols (HTTP, HTTPS, FTP, SCP, SFTP, etc.).
- Focuses on flexibility and allows sending HTTP requests (GET, POST, PUT, DELETE, etc.).
- Outputs data to standard output (stdout) by default.

Use curl when:
- You need to interact with APIs (e.g., sending POST requests with JSON data).
- You want more fine-grained control over HTTP headers and authentication.
- You need to download multiple files in parallel.

wget (Web Get):
- A simpler command mainly designed for downloading files over HTTP, HTTPS, and FTP.
- Supports recursive downloads (e.g., downloading entire websites).
- Saves files directly to disk by default.

Use wget when:
- You want to download an entire website or directory recursively.
- You need automatic retry functionality for unreliable connections.
- You prefer a simpler syntax for downloading a single file.