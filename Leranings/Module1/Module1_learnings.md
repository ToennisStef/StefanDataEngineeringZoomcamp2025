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


## Docker 

Docker is used to containerize application, scripts, etc. 

useful commands in bash:

- `docker ps`
    - lists all the currently running containers along with their details.

- `docker ps -a`
    - will show all containers, regardless of their state.

When you run a Docker container with the --entrypoint option and then exit the container, it will stop because the main process (in this case, bash) has terminated. By default, Docker removes the container when it stops if you used the --rm option when starting the container.

To keep the container running after you exit, you can start it in detached mode and then attach to it as needed. Here’s how you can do it:

Run the container in detached mode using the -d option:
`docker run -d --name my_python_container python:3.12.8 tail -f /dev/null`

This command starts the container and keeps it running by using tail `-f /dev/null` as the command, which effectively does nothing but keeps the container alive.

You can remove all stopped Docker containers using the following command:
`docker container prune`

## docker compose

docker compose is used to set up docker networks. 
Networks are used so different containers can interact with each other. 
In the DataEngineeringZoomcamp25" example we ran the "postgres:13" docker image and the "dpage/pgadmin4" docker image, containing postgres and pgadmin respectively. 
The problem is if both docker container run individually, i would not be able to access my database with the pgadmin container since it cannot access the data base which is loaded in the postgres container. 
You can easily start, stop, and restart all services with a single command (docker-compose up).
An example of a `docker-compose.yaml` file can be found [here](../docker-compose.yml).


## Terraform

Essentially a way to interact with cloud services via scripts. 
Can be used to set up all sorts of stuff, like data storage bucket on "google cloud computing", or a "BigQuery" dataset.
The files here are stored savely on my personal desktop. 
It is very important to not publish the credentials file that gives access to the service profile. 