# Data Warehouse

## What makes a data warehouse different from normal SQL database?

### Transactional Workloads vs Analytical Workloads

A transactional workload is the querying workload that serves normal business applications. When a visitor loads a product page in a web app, a query is sent to the database to fetch this product, and return the result to the application for processing.

Here are several common attributes of transactional workloads:


- Each query usually retrieves a single record, or a small amount of records (e.g. get the first 10 blog posts in a category)
- Transactional workloads typically involve simple queries that take a very short time to run (less than 1 second)
- Lots of concurrent queries at any point in time, limited by the number of concurrent visitors of the application. For big websites this can go to the thousands or hundreds of thousands.
- Usually interested in the whole data record (e.g. every column in the product table).

Analytical workloads, on the other hand, refer to workload for analytical purposes, the kind of workload that this book talks about. When a data report is run, a query will be sent to DB to calculate the results, and then displayed to end-users.

Analytical workloads, on the other hand, have the following attributes:

- Each query typically scans a large number of rows in the table.
- Each query is heavy and takes a long time (minutes, or even hours) to finish
- Not a lot of concurrent queries happen, limited by the amount of reports or internal staff members using the analytics system.
- Usually interested in just a few columns of data.


### The Backend for Analytics Databases is Different

Because of the drastic difference between the two workloads above, the underlying backend design of the database for the two workloads are very different. Transactional databases are optimized for fast, short queries with high concurrent volume, while analytical databases are optimized for long-running, resource-intensive queries.

analytical databases use the following techniques to guarantee superior performance:

- Columnar storage engine: Instead of storing data row by row on disk, analytical databases group columns of data together and store them.
- Compression of columnar data: Data within each column is compressed for smaller storage and faster retrieval.
- Parallelization of query executions: Modern analytical databases are typically run on top of thousands of machines. Each analytical query can thus be split into multiple smaller queries to be executed in parallel amongst those machines (divide and conquer strategy)

see the video on data warehouses specifically on the google bigQuery architecture.

MySQL, PostgreSQL, MSSQL, and Oracle databases are designed to handle transactional workloads, whereas data warehouses are designed to handle analytical workloads.


## Can I use a normal SQL database as my data warehouse?

f you’re just starting out with small set of data and few analytical use cases, it’s perfectly fine to pick a normal SQL database as your data warehouse (most popular ones are MySQL, PostgreSQL, MSSQL or Oracle). If you’re relatively big with lots of data, you still can, but it will require proper tuning and configuring.

That said, with the advent of low-cost data warehouse like BigQuery, Redshift above, we would recommend you go ahead with a data warehouse.

However, if you must choose a normal SQL-based database (for example your business only allows you to host it on-premise, within your own network) we recommend going with PostgreSQL as it has the most features supported for analytics. 

## OLAP vs OLTP

Online Transaction Processing (OLTP)

Online Analytical Process (OLAP)

## Partioning and Clustering

Partitioning is a way organize the structured data into sub-structures.
Clusters are used to further sub-divide the partitions.

An example are Data Columns: You can partition a table by its date column. The table is then "kind of" divided into a table for each unique data in the original non-partitioned table, but there are no real "physical" tables created for each day but rather a partitioned table is created containing these sub-tables.

Partitioning and clustering is both great to reduce the overal compute and data usage. Reiterating on the data partitioning example: assuming we want to perform a query for a specific date:

```sql
SELECT * FROM YOUR_TABLE AS T
    WHERE T.data == 'somedate'
```

If you run this query on your non-partitioned table the whole table is loaded. 
When you run this query on your partitioned table it loads only the specific partition for the specified day.


- Table with data size < 1GB, don't show significant improvements with partitioning and clustering

## BigQuery partition

- Partition can be done in different ways:
    - Time-unit partitioning 
    - Integer-range partitioning
- Number of partitions is limited to 4000 

## BigQuery clustering

- Specified columns are used to colocate related data
- Order of the column is important
- Clustering improves:
    - Filter query
    - Aggregate queries
- Specify up to 4 clustering columns
- Clustering columns must be top-level, non-repeated columns:
    - DATE
    - BOOL
    - GEOGRAPHY
    - INT64
    - NUMERIC
    - BIGNUMERIC
    - STRING
    - TIMESTAMP
    - DATETIME

## BigQuery best practice

Cost reduction:
- Avoid `SELECT *`
- Price queries before running them
- Use clustered or partitioned tables
- Use streaming inserts with caution
- Materialize query results in stages

Query perfmorance:
- Filter on partitioned columns
- Denormalize data
- Use nested or repeated columns
- Use external data sources appropriately
- Reduce data before using a `JOIN`
- Do not treat `WITH` clauses as prepared statements
- Avoid oversharding tables
- Avoid JavaScript user-defined functions
- Use approximate aggregation functions (HyperLogLog++)
- Order Last, for query operations to maximize performance
- As best practice:
    - place the table with the largest number of rows first, followed by the table with the fewest rows, and then place the remaining tables by decreasing size