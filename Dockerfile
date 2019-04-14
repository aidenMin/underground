FROM python:3.7.2
MAINTAINER Aiden Min (aiden@dunamu.com)

# Install Python and Package Libraries
RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
RUN apt-get install -y

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

# Prepare src home
ENV SRC_HOME=/usr/src
ENV APP_HOME=$SRC_HOME/app
RUN mkdir -p $SRC_HOME

# Python path related environments
ENV PYTHONUSERBASE=$SRC_HOME/pyenv
ENV PYTHONPATH=$APP_HOME

COPY ./requirements.txt $SRC_HOME/
WORKDIR $SRC_HOME

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Server
EXPOSE 8000
STOPSIGNAL SIGINT
ENTRYPOINT ["python", "manage.py"]
CMD ["runserver", "0.0.0.0:8000"]
