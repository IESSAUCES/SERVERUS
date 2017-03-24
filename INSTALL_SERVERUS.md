# SERVERUS
*Guia de instalación paso a paso*
[Servidor SERVERUS](http://www.serverus.local "Servidor SERVERUS")
## 1. CONFIGURACIÓN DEL SERVIDOR
- [ ] Nombre del servidor
- [ ] Configuración de red
- [ ] Conectividad Internet

## 2. ACCESO REMOTO
- [ ] Instalación de SSH
- [ ] Cliente SSH

## 3. SERVIDOR WEB

- [ ] Instalación apache
- [ ] Comprobación de funcionamiento

## 4. SERVIDOR DNS
- [ ] Instalación bind9

```bash
sudo apt-get update
sudo apt-get install bind9
```
- [ ] Configuración de zona de resolucion directa "serverus.local". Crear el fichero /etc/bind/db.samuel.local.

```bash
;
; BIND data file for SVG-US02.samuel.local
;
$TTL	604800
@	IN	SOA	SVG-US02.samuel.local. svara71.gmail.samuel.local. (
			      1		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 3600 )		; Negative Cache TTL
;
@		IN	NS	SVG-US02.samuel.local.
@		IN	A	192.168.3.102
SVG-US02	IN	A	192.168.3.102
www		IN	CNAME	SVG-US02
ftp.samuel.local.	IN	CNAME	SVG-US02
````
- [ ] Chequear el fichero anterior.
´´´bash
# sudo named-checkzone  nombredelazona    ficherocontienelazona
named-checkzone  samuel.local      /etc/bind/db.samuel.local
´´´


## 5. SERVIDOR DE APLICACIONES PHP con MySQL

### MySQL

- [ ] Instalación de MySQL
- [ ] Testear funcionamiento de MySQL
    
### PHP 7.0
- [ ] Instalación de **PHP7.0**
- [ ] Testear funcionamiento de PHP
        
### MÓDULOS PHP7.0
```bash
sudo apt-get install nombredelmodulo
```
### Instalación de módulos
- [ ] libapache2-mod-php7.0 
- [ ] php7.0-mysql
- [ ] php7.0-intl
- [ ] php7.0-curl
- [ ] php7.0-soap

### Instalacion phpMyAdmin
- [ ] Instalación phpmyadmin
- [ ] Comprobación http://IP/phpmyadmin
  
  
## 6. DAR DE ALTA USUARIOS DEL SISTEMA

1. Crear grupo sftpusers
```bash
sudo  addgroup sftpusers
```
2. Ejecutar el script crear usuarios
```bash
sudo  ./crearUsuario.sh
```
3. SFTP: Enjaular o aislar usuarios

## 7. MYSQL: DAR DE ALTA USUARIOS



    

