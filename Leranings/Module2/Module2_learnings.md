# Module 2 

## Kestra

Kestra is an open source workflow orchestration tool. The data engineering zoomcamp is sponsored by kestra. 

Kestra has many useful plugins to automate workflows and be compatible with many different application as for example google cloud computing. 

The most popular alternative is still Apache Airflow.



## Kestra in Docker compose

Executable scripts are called *flows* in kestra and are stored as `.yaml` files. 
Kestra uses postgresql for its datamanagemnet. When executing kestra through docker-compose there is an postgres container defined which manages the data storage. So when an additional postgresql database is needed add an additional postgresql container. 

There are often compatibility errors when using older postgresql versions/docker-images. 

