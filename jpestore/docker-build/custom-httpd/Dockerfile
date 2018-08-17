FROM httpd:latest

MAINTAINER mwsong <mwsong@rockplace.co.kr>

# Include proxy conf
RUN set -ex \
	&& cd /usr/local/apache2/conf \
	&& if [ -f httpd.conf ]; then \
		echo '' >> httpd.conf; \
		echo '## Proxy Configuration ' >> httpd.conf; \ 
 		echo 'Include conf/extra/proxy.conf' >> httpd.conf; \
 	fi
 	
# Add mod_proxy conf files
ADD proxy.conf /usr/local/apache2/conf/extra/ 

EXPOSE 80

CMD ["httpd-foreground"]
 
