FROM ubuntu:22.04
RUN apt-get -y update
RUN apt-get install -y curl supervisor squid-openssl openssl 
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY squid-ca.crt /usr/loca/share/ca-certificates/
COPy squid.conf /etc/squid
RUN update-ca-certificates
COPY squid-ca.pem /etc/squid/
COPY squid-ca.crt /etc/squid/
COPY start.sh /
RUN  /usr/lib/squid/security_file_certgen -c -s /var/spool/squid/ssl_db -M 4MB
RUN squid -z   
RUN chmod -R 777 /var/spool/squid
RUN cp -r /etc/squid /tmp
EXPOSE 3127
EXPOSE 3128
EXPOSE 3129
EXPOSE 3130
CMD ["/usr/bin/supervisord"]
