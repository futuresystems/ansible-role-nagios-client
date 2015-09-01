
FROM phusion/baseimage:0.9.17

RUN apt-get update
RUN apt-get -y install python-dev python-pip httpie
RUN pip install jinja2 ansible

RUN mkdir -p /test/roles/nagios_client
ADD defaults /test/roles/nagios_client/defaults
ADD handlers /test/roles/nagios_client/handlers
ADD tasks /test/roles/nagios_client/tasks
ADD templates /test/roles/nagios_client/templates
ADD test /test/

WORKDIR /test
ENTRYPOINT ./run.sh
