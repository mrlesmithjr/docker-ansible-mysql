FROM mrlesmithjr/ubuntu-ansible:14.04

MAINTAINER Larry Smith Jr. <mrlesmithjr@gmail.com>

# Copy Ansible Related Files
COPY config/ansible/ /

# Install MySQL
RUN ansible-playbook -i "localhost," -c local /playbook.yml

# Cleanup
RUN apt-get -y clean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy Docker Entrypoint
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

# Setup volume
VOLUME /var/lib/mysql

# Expose port(s)
EXPOSE 3306

# Container start-up
CMD ["/usr/bin/dumb-init", "mysqld"]
