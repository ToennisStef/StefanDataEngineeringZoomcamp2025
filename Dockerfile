FROM python:3.9

RUN apt-get install wget
RUN apt-get install curl
RUN pip install pandas sqlalchemy psycopg2 pyarrow


WORKDIR \app
COPY IngestData.py IngestData.py

ENTRYPOINT [ "python", "IngestData.py" ]