# SERVERUS: SFTP
*Guia de instalación paso a paso*
[Servidor SERVERUS](http://www.serverus.local "Servidor SERVERUS")
## 1.CREACIÓN DE GRUPO DE USUARIOS sftpusers
```bash
sudo addgroup nombregrupo
```
## 2. COMPROBAR: Apache instalado
```bash
sudo dpkg-query   apache2
```
## 3. COMPROBAR: Directorio del usuario
```bash
ls /var/www
```

## 4. CREAR USUARIO
```bash
sudo useradd -G sftpusers -m -d  "directoriohome" -g www-data -p "paso" "nombreUsuario"
```

## 5. CAMBIAR EL PASSWORD
```bash
sudo passwd nombreUsuario
```

## 6. PERMISOS Y CARPETA public_html
```bash
#Necesario para el chroot
chown root:root "/var/www/nombreUsuario"

#Creamos el directorio de apache
mkdir "/var/www/nombreUsuario/public_html"


#Asignamos permisos al directorio www
chmod -c 2775 /var/www/nombreUsuario/public_html"
chgrp "www-data" "/var/www/nombreUsuario/public_html"
chown nombreUsuario "/var/www/nombreUsuario/public_html"

```
    
## 7.-  Configuración de SFTP

- [ ] Copia de seguridad del fichero 

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.000
```
- [ ] Editar el fichero de configuración /etc/ssh/sshd_config
Cambiar la línea
 
```bash
Subsystem	sftp	/usr/lib/openssh/sftp-server
```
por
        
```bash
Subsystem sftp internal-sftp
UsePAM yes
```

### Restricción de acceso por usuario
```bash
  Match user usuario1
  ChrootDirectory /var/www/usuario1
  ForceCommand internal-sftp
```

### Restricción de acceso por grupo

```bash
Match Group ftpusers
ChrootDirectory %h
ForceCommand internal-sftp
```
## 8.- Reiniciar el servicio
```bash
sudo service ssh restart
```
## 9.- Comprobación desde FileZilla o bien, Notepad++