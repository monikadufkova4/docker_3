# syntax=docker/dockerfile:1

#FROM python:3.8-slim-buster
FROM python:3.9.0b4-alpine3.12

ENV PYTHONUNBUFFERED=1
WORKDIR /app

#COPY . .
#COPY requirements.txt requirements.txt
#RUN pip install -r requirements.txt


COPY crontab.Development /var/spool/cron/crontabs/crontab.Development

COPY root  /var/spool/cron/crontabs/root
RUN chom +x app.py
RUN apk add --update --no-cache bash do2unix

# Add crontab file in the cron directory
#ADD crontab /etc/cron.d/hello-cron


#RUN apt-get update && apt-get upgrade -y \
# && apt-get install -y git \
# && apt-get -y install cron



# Fix line endings && execute permissions
#RUN dos2unix crontab.* \
#    && \
#    find . -type f -iname "*.sh" -exec chmod +x {} \;

RUN find . -type f -iname "*.sh" -exec chmod +x {} \;


CMD crond -l 2 -f
# Create the log file to be able to run tail
#RUN touch /home/mdufkova/docker_training/cron.log



# Add crontab file in the cron directory
#ADD crontab /etc/cron.d/hello-cron


# Run cron on container startup
#CMD ["./start.sh"]
#CMD ["cron", "-f"]
#CMD ["python3", "app.py"]


# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=5000"]   to co bych napsala v terminalu




# sudo docker build --tag docker_training .      nebo    docker build -f <path/to/Dockerfile>

# docker build -i docker_training .
# docker run -it --name  docker_training docker_training


# sudo docker ps -a
# sudo docker container stop 9bea67a98507