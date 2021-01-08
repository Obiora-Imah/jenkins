FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

#RUN rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum -y install nginx openssl --enablerepo=nginx
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN dnf -y install dnf-utils
RUN dnf -y module install php:remi-7.4
RUN yum -y install php-cli     
RUN yum -y install php-fpm 
RUN yum -y install php-mysqlnd 
RUN yum -y install php-zip 
RUN yum -y install php-devel   
RUN yum -y install php-gd 
RUN yum -y install php-mcrypt  
RUN yum -y install php-mbstring
RUN yum -y install php-curl    
RUN yum -y install php-xml     
RUN yum -y install php-pear    
RUN yum -y install php-bcmath  
RUN yum -y install php-json
RUN yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh


