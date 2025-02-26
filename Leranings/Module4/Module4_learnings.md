# Module 4

## ETL vs ELT:

Before we did ETL (Extract-Transform-Load) when handling data now we want to do ELT (Extract-Load-Transform).



###  ETL:
- Slightly more stable and compliant data analysis
- Higher storage and compute cost

In this process, an ETL tool extracts the data from different data source systems, transforms the data by applying calculations, concatenations, and the like, and finally loads the data into the data warehouse.

What happens in this approach:

- You extract data from sources (write queries on your SQL databases, or send data extract requests to an application via its API).
- Extracted data will be transformed in the ETL tool’s memory.
- Transformed data is then loaded in the final data storage/warehouse.

The key things to note here is that raw data is transformed outside of the data warehouse, usually with the help of a dedicated “staging server”; and that only transformed data is loaded into the warehouse.


### ELT
- Faster and more flexible data analysis
- Lower cost and lower maintenance

What happens in this approach:

- You extract data from sources.
- Instead of transforming in-memory, using a pipelining tool, you load the raw, extracted data straight into the destination data storage/warehouse.
- Finally, you perform any necessary transformations within your data warehouse

The key things to note here are that raw data is transformed inside the data warehouse without the need of a staging server; your data warehouse now contains both raw data and transformed data.

## The shift from ETL to ELT

Historically, building a data warehouse was a very expensive undertaking, both on the hardware side and on the software side. The server costs, implementation costs and software licenses for a data warehousing project 20 to 30 years ago could easily go up to the millions of dollars and take months to implement.

- Since data warehouses were so expensive, to save on cost, people would only want to load clean, properly transformed and aggregated data into the data warehouse.
- Practitioners were still following waterfall development models back then, so it was acceptable to take the time to plan out and perform proper transformations.

In this context, the ETL model made perfect sense: raw data was properly transformed in a staging server (or ETL pipelining tool) before being loaded into your ridiculously expensive data warehouse. The volume of data that was handled by such tools back then was relatively small, and thus manageable for most staging servers to handle.

But the ETL approach has a number of drawbacks when viewed through a more contemporary lens:

- Every new set of transformations would require involvement from IT or from data engineering, in order to code up new transformations. The ETL tools used in the old paradigm were hardly accessible to data analysts after all, who would traditionally come from an SQL background. As a result, data analysts relied on data engineering for access to new transformed data, and would often have to wait for days before they could get to implement new reports.
- As data sizes increased, the ETL approach became more and more problematic. Specifically, the staging server — that is, the machine that orchestrated all the loading and transforming of data — began to be a bottleneck for the rest of the stack.

So what changed? Well, a couple of things emerged in the 2010s that made an alternative approach possible:

- First, we saw the commoditization of the cloud data warehouse. Modern data warehouses today can store and process a very large amount of data at very little cost.
- We also saw an explosion in the amount and in the variety of data being collected. Some of us have heard of this change as the ‘big data revolution’ — which was a fad in the mid 2010s. The end result of that fad, however, was good for all of us: it pushed the development of new tools and new approaches to data, all of which were built around the assumption of needing to deal with terabyte-level data volumes at a minimum.
- And finally, we saw the rise of lean and agile software development practices. Such practices meant that people began to expect more from their data departments, the same way that they were used to quick execution speeds in their software development teams.

And so at some point, people began to realize: the cost of storing and processing data had become so cheap, it was now a better idea to just dump all your data into a central location, before applying any transformations.

In contrast to ETL, an ELT approach has a number of advantages:

- It removes the performance bottleneck at the staging server/ETL pipelining tool. This is significant because data warehouses had increased in processing power at a level far beyond the most advanced ETL pipelining tool. The ELT approach assumes a powerful data warehouse at its core.
- It does not demand detailed planning on what data to transform beforehand. Data practitioners began to take a more agile approach to analytics, aka “dump first, transform later”.
- With proper transform and modeling tools, ELT did not require data engineers to be on standby to support any transformation request from the analytics team. This empowered data analysts, and increased execution speed.

## What About Data Lakes?

A data lake is a fancy term for a central staging area for raw data. The idea is to have everything in your organization dumped into a central lake, before loading it into your data warehouse. Unlike data warehouses (which we have talked about extensively in our discussion about ELT, above) lakes are often object buckets in which you may upload all manner of unstructured data: examples of buckets are services like AWS S3 or Google Cloud Storage; examples of unstructured data are CSV dumps or even text files, exported from various source systems.

## What is data modeling and why is it needed?

The process of mapping raw data to a format that can be easily understood by business users is known as ‘data modeling’. There are other reasons to do data modeling, of course. Performance is one of them, as is explorability. But at its most basic level, data modeling is about taking raw data and transforming it into a form that is useful for business measurement. 

The contemporary approach to doing data modeling is to orchestrate transformations within the data warehouse, via a tool that sits on top of the data warehouse. This stands in contrast to ETL tools in the past, which usually exist as pipelines external to the data warehouse.

These tools include such tools like Holistics, dbt, dataform and Looker. These tools share a couple of similar characteristics:

- They connect to your data warehouse.
- They treat the modeling process as the act of transforming data from old tables to new ones within the data warehouse.
- They generate SQL behind the scenes to execute such transformations.
- They allow users to annotate, manage, and track changes to data models over time.
- They allow users to trace the lineage of data transformations within a single tool.

There isn’t a good name for such tools right now. For the sake of convenience, we will call them ‘data modeling layer’ tools. Conceptually, they present a ‘data modeling layer’ to the analytics department.

A data modeling layer is a system that contains the mapping between business logic and underlying data storage rules of your business. It exists primarily in the ELT paradigm, where data is loaded into the data warehouse first before being transformed.

In this context, data modeling is the process of building and maintaining this layer.

Usually, the data modeling layer will later be connected to some visualization tool or business intelligence layer. Non-technical users should be able to log in, interact with some user interface, and get the analytics they need, without the requirement to talk to anyone technical.

With a proper, well-maintained data modeling layer, everyone is happy:

- The CEO can just log in to the BI application, ask questions and get the right numbers that she needs, without waiting for the data analyst. In other words, business users can now do self-service analytics.
- The data analyst’s job is now focused on maintaining the data pipeline and modeling layer, without being bombarded by adhoc data requests.
- The entire company has a well-documented layer of data knowledge. Even if the data analyst is busy or leaves the company, this knowledge is properly annotated and organized, and not at risk of being lost.

## Data Modeling Layer Concepts



There are many important data modeling approaches. Important approaches are:
- Kimball's Dimensional Modeling
- Bill Inmon 
- Data vault 

