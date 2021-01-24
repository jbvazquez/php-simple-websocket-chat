# PHP Simple WebSocket Chat

![Pantalla](https://github.com/jbvazquez/php-simple-websocket-chat/blob/master/cliente/img/pantallaso.jpg?raw=true)

Usa la librería https://github.com/ghedipunk/PHP-Websockets

## Características
* Sala pública
* Sala privada por usuario conectado
* Contador de mensajes sin leer por sala
* Contador de usuarios escribiendo por sala

## Manual

### Correr servidor

* Mover a la carpeta servidor `cd servidor`
* Opcional: editar parámetros en `chat.php`
* Ejecutar servidor `./chat.php` o `php chat.php`

### Correr en cliente
* Abrir cliente/index.html
* Modificar parámetros de servidor y nombre de usuario
* Conectar

---

### Vagrant Homestead

* Servidor: `$echo = new chat_server("192.168.10.10","5001");`
* En máquina host `myVirtualHost.test/php-simple-websocket-chat/cliente/index.html`

#### Túnel SSH para transmitir por red local
* Maquina host: `ssh -L (local host ip):5001:192.168.10.10:5001 vagrant@homestead.test`
* Máquina en red: `http://(local host ip):8000/php-simple-websocket-chat/cliente/index.html`

---
## [Docker](https://docs.docker.com/get-started/overview/)
### Windows
* Instalación oficial [Install Docker Desktop on Windows](https://docs.docker.com/docker-for-windows/install/)
* Docker Version:
	```
	Server: Docker Engine - Community
	Engine:
	Version:          20.10.2
	API version:      1.41 (minimum version 1.12)
	Go version:       go1.13.15
	Git commit:       8891c58
	Built:            Mon Dec 28 16:15:28 2020
	OS/Arch:          linux/amd64
	Experimental:     false
	containerd:
	Version:          1.4.3
	GitCommit:        269548fa27e0089a8b8278fc4fc781d7f65a939b
	runc:
	Version:          1.0.0-rc92
	GitCommit:        ff819c7e9184c13b7c2607fe6c30ae19403a7aff
	docker-init:
	Version:          0.19.0
	GitCommit:        de40ad0
	```
* [PHP Docker Official Images](https://hub.docker.com/_/php)
 * Tag: [7.4-apache](https://github.com/docker-library/php/blob/74175669f4162058e1fb0d2b0cf342e35f9c0804/7.4/buster/apache/Dockerfile) 
 * Esta imagen contiene Apache httpd de Debian junto con PHP
 * PHP Version 7.4.14
 * Apache 2.0 Handler

### Creación de imagen PHP personalizada
* Correr `build_image.bat`
 * El batch file realiza el pull de la imagen de PHP desde el Docker Hub, instala las extensiones necesarias y la publicación de los puertos usados.

### Como correr el contenedor 
* Correr `run_container.bat`
 * Al terminar la ejecución del batch file ej. `Ctrl+C`, el contenedor se debe de borrar automáticamente, de lo contrario se puede eliminar manualmente desde el dashboard o usando el comando `docker container rm [container_id]`.
 * **Nota:** La ejecución del contenedor se realiza en modo interactivo `--interactive , -i` `--tty , -t` 
   * Cambiar el tamaño de la ventana de comandos puede detener el servidor Apache al recibir una señal [SIGWINCH](https://stackoverflow.com/questions/48086606/docker-container-exits-when-using-it-option).
   * Ejemplo de error:
   ```
   [mpm_prefork:notice] [pid 1] AH00170: caught SIGWINCH, shutting down gracefully
   ```
   La implementación de la ejecución del contenedor en segundo plano puede ser útil para este caso `--detach , -d` sin embargo, por defecto se usa el modo interactivo para depurar.

### Como acceder a la terminal bin/bash del contenedor
* Correr `run_container_bash.bat`
  * [docker exec](https://docs.docker.com/engine/reference/commandline/exec/)

### Como correr el servidor
* Correr `run_chat_server.bat`
  * Ejemplo de ejecución del servidor
  ![run_chat_server](https://github.com/jbvazquez/php-simple-websocket-chat/blob/docker-container/docker-container/img/run_chat_server_snip.png?raw=true)
  
### Como acceder al cliente
* Desde el navegador acceder a la URL (http://localhost/php-simple-websocket-chat/cliente/)

### Obtener información de PHP
* Desde el navegador acceder a URL (http://localhost/)

### Linux
Próximamente...

