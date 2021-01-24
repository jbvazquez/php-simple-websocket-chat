@echo off
docker run --rm -it ^
	-v %CD%/../php-simple-websocket-chat:/var/www/html/php-simple-websocket-chat ^
        -v %CD%/src:/var/www/html/ ^
        --expose 80 ^
        --expose 5001 ^
        -p 80:80 -p 5001:5001 ^
        --name php_container ^
        php-simple-websocket-chat
pause

