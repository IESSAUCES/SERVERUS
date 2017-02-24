# Comprobamos que se ejecuta con permisos de root
user=$(whoami)
if [ "$user" != "root" ]; then
    echo "Necesitas tener permisos de root :("
    exit 1
fi


# Creamos las variables
# DIR_APACHE es el directorio donde estaran todos los home de los usuarios
# GRUPO_SFTP sera el grupo deberemos tener creado

DIR_APACHE="/var/www/"
GRUPO_SFTP="sftpusers"
DOMINIO="sauces.local"
SUFIJO_USUARIO="DAW"


# Comprobamos que el grupo de usuarios existe
# Con esta linea mostramos el fichero /etc/group si no muestra ninguna linea el codigo de error es 1
more /etc/group | grep "$GRUPO_SFTP" > /dev/null

if [ $? != 0 ]; then
    echo "Error!, el grupo $GRUPO_SFTP no existe"
    exit 0
fi 

#Comprobamos que el directorio de usuarios existe
if [ ! -d "$DIR_APACHE" ]; then
    echo "Error!, el directorio de usuarios no existe"
    exit 0
fi


#Pedimos el nombre de usuario hasta que se introduza un nombre
#while  [ "$USUARIO" == "" ]
#do
#	echo "Introduzca el nombre de usuario: "
#	read USUARIO
#done

CURSO=2
echo "CURSO $CURSO"
while [ $CURSO -lt 3 ]; do
	echo "CURSO: $CURSO "
	if [ $CURSO -eq 1 ]; then
	VALOR_INICIAL=101
	VALOR_FINAL=117
	else
	VALOR_INICIAL=201
	VALOR_FINAL=217
	fi
	let CURSO+=1
	echo "VALOR INICIAL $VALOR_INICIAL"
	for (( NUM=VALOR_INICIAL; NUM<=VALOR_FINAL; NUM++ ))
		do
		echo $NUM " "
		USUARIO=$SUFIJO_USUARIO$NUM;
		echo $USUARIO;

		#Vamos con apache
		#Borramos el sitio de cada usuario

		#Habilitamos el sitio
	 	a2dissite "$USUARIO.conf"
		echo "Ha sido borrado el Sitio  para el dominio http://$USUARIO.$DOMINIO"
		rm "/etc/apache2/sites-available/$USUARIO.conf"
		done
done
#Reiniciamos apache
 /etc/init.d/apache2 restart

