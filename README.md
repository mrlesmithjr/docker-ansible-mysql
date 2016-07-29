Repository Information
======================
Builds a [Docker] container running [MySQL] ready for use. Provisioning provided via [Ansible].

How-To
------
Build
```
docker build -t ansible-mysql .
```

Consume

`default`
```
docker run -d --name mysql -p 3306:3306 mrlesmithjr/mysql                                
```
`define root password`
```
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=P@55w0rd -p 3306:3306 mrlesmithjr/mysql
```
`define db to create`
```
docker run -d --name mysql -e MYSQL_DB=pdns -p 3306:3306 mrlesmithjr/mysql
```
`define db, user, and password`
```
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=P@55w0rd -e MYSQL_DB=phpipam -e MYSQL_USER=phpipam -e MYSQL_PASS=phpipam -p 3306:3306 mrlesmithjr/mysql
```
`define volume for persistent storage`
```
docker run -d --name mysql -v ./data:/var/lib/mysql -p 3306:3306 mrlesmithjr/mysql
```

License
-------

BSD

Author Information
------------------

Larry Smith Jr.
- [@mrlesmithjr]
- [everythingshouldbevirtual.com]
- [mrlesmithjr@gmail.com]


[MySQL]: <http://mysql.com>
[Docker]: <https://www.docker.com>
[Ansible]: <https://www.ansible.com/>
[@mrlesmithjr]: <https://twitter.com/mrlesmithjr>
[everythingshouldbevirtual.com]: <http://everythingshouldbevirtual.com>
[mrlesmithjr@gmail.com]: <mailto:mrlesmithjr@gmail.com>
