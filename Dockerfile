FROM  fluent/fluentd:v1.10
MAINTAINER Mattias Hemmingsson mattias.hemmingsson@booli.se

USER root
RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev 
RUN apk add --no-cache libstdc++ 
 
RUN fluent-gem install fluent-plugin-elasticsearch \
 && sudo fluent-gem install fluent-plugin-docker \
 &&  sudo gem install \
        fluent-plugin-secure-forward \
 && sudo gem install \
        fluent-plugin-grok-parser \
 && sudo gem install \
	 fluent-plugin-multi-format-parser \
 && sudo gem install \
        fluent-plugin-nats \
 && sudo gem install \
        fluent-plugin-route \
 && sudo gem install \
        fluent-plugin-rewrite-tag-filter \
 && sudo gem install \
        fluent-plugin-prometheus \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem

USER fluent

EXPOSE 24284
