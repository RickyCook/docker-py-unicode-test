FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
        python python3 virtualenv \
        docker.io

ENV DOCKER_HOST tcp://172.17.42.1:2375

ADD . /code
WORKDIR /code
ENTRYPOINT ["./run.sh"]
CMD ["3.4"]
