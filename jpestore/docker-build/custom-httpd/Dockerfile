FROM httpd:latest

MAINTAINER mwsong <mwsong@rockplace.co.kr>

# Include proxy conf
RUN set -ex \
	&& cd /usr/local/apache2/conf \
	&& if [ -f httpd.conf ]; then \
		echo '' >> httpd.conf; \
		echo '## add external Configuration ' >> httpd.conf; \ 
 		echo 'Include conf.d/*.conf' >> httpd.conf; \
 	fi
 	
RUN mkdir /usr/local/apache2/conf.d/

# Add mod_proxy conf files
ADD httpd-proxy.conf /usr/local/apache2/conf.d/httpd-proxy.conf

EXPOSE 80

CMD ["httpd-foreground"]
 
