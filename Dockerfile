FROM ubuntu
EXPOSE 8153
RUN apt-get update
RUN apt-get install -y --assume-yes curl gnupg2 software-properties-common
RUN echo "deb https://download.gocd.org /" | tee /etc/apt/sources.list.d/gocd.list
RUN curl https://download.gocd.org/GOCD-GPG-KEY.asc | apt-key add -
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y openjdk-8-jre go-server go-agent
CMD /etc/init.d/go-server start && /etc/init.d/go-agent start