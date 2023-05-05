FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Java 8
RUN apt-get update && \
    apt-get install wget --yes && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install x11-xserver-utils --yes && \
    apt-get install maven --yes && \ 
    apt-get install xdg-utils --yes && \
    apt-get install xfonts-utils --yes && \
    apt-get install eom --yes && \
    apt-get install gnome-tweaks --yes && \
    apt-get install python3-pip --yes && \
    apt-get install python3-tk --yes && \
    apt-get install graphviz --yes && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python 3 packages
RUN pip3 install Cython
RUN pip3 install \
    'pandas' \
    'pyspark' \
    'graphviz' \
    'widgetsnbextension' \
    'pyarrow' \
    'pm4py'
RUN pip3 install ipython==7.22.0
RUN pip3 install opencv-python-headless

# Install Hadoop
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-3.2.2/hadoop-3.2.2.tar.gz && \
    tar -xzf hadoop-3.2.2.tar.gz && \
    mv hadoop-3.2.2 /usr/local/hadoop && \
    rm hadoop-3.2.2.tar.gz

# Set environment variables for Hadoop
ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# Install Spark
RUN wget https://archive.apache.org/dist/spark/spark-3.0.3/spark-3.0.3-bin-hadoop3.2.tgz && \
    tar -xzf spark-3.0.3-bin-hadoop3.2.tgz && \
    mv spark-3.0.3-bin-hadoop3.2 /usr/local/spark && \
    rm spark-3.0.3-bin-hadoop3.2.tgz

# Set environment variables for Spark
ENV SPARK_HOME /usr/local/spark
ENV PATH $PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
ENV DISPLAY=host.docker.internal:0.0

# Expose Hadoop and Spark ports
EXPOSE 8088 9870 4040

CMD ["bash"]

WORKDIR home/jovyan/work/BIG2/BigSpark
ENTRYPOINT PYTHONSTARTUP="GUI.py" pyspark
