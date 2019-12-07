# LAB-BazyDanych

Docker image for Cassandra + HBase + Jupyter Notebook. 
To run all of these services:
```bash
docker build -t 0xdfdfdf/jupyter-cassandra-hbase ./docker/
docker run -d -p 8888:8888 -p 16010:16010 0xdfdfdf/jupyter-cassandra-hbase:latest docker-entrypoint.sh --NotebookApp.password='sha1:d8903401e924:be8e89516459422c0fcda15e26cf02b5bd41bbce'
```
Jupyter will be available [here](http://localhost:8888) and the password is *kie*. 
Terminals are available.

### Cassandra
Open a new terminal in Jupyter and type:
```bash
nodetool status
cqlsh
```

### HBase
HBase web UI is [here](http://localhost:16010).
To gain access to HBase shell, open a new terminal in Jupyter and type:
```bash
hbase shell
```

# Credits
My image is just a poor juxtaposition of dockerfiles of [base-notebook](https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile), [cassandra](https://github.com/docker-library/cassandra/blob/master/2.1/Dockerfile) and [hbase](https://github.com/birlinn/hbase2-docker/blob/master/Dockerfile).
Some files comes from these repositories and all the credit should go there.
