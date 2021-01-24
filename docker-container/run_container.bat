@echo off
docker run --rm -it  ^
	-v %CD%/../php-simple-websocket-chat:/var/www/html/php-simple-websocket-chat ^
        -v %CD%/src:/var/www/html/ ^
        -p 80:80 -p 5001:5001 ^
        --expose 5001/tcp ^
        --expose 5001/udp ^
        --name php_container ^
        php:7.4-apache
pause

