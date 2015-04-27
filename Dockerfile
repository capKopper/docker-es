FROM elasticsearch:1.5.1

ADD files/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
ADD files/init.sh /init.sh
RUN chmod u+x /init.sh

EXPOSE 9200
EXPOSE 9300
CMD ["/init.sh"]