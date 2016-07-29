FROM ubuntu:14.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Update apt-cache
RUN apt-get update

# Install Ansible
RUN apt-get -y install git software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get -y install ansible

# Copy Ansible Playbook
COPY playbook.yml /playbook.yml

# Install MySQL
RUN ansible-playbook -i "localhost," -c local /playbook.yml

# Cleanup
RUN apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup entrypoint Ansible Playbook
COPY docker-entrypoint.yml /docker-entrypoint.yml

# Setup entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# Setup volume
VOLUME /var/lib/mysql

# Expose port(s)
EXPOSE 3306

# Container start-up
CMD ["mysqld"]
