FROM debian:testing

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Install the `dpkg-buildpackage` command
RUN apt-get update
RUN apt-get install --yes build-essential debhelper devscripts

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
