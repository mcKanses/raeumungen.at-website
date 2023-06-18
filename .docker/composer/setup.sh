rootdir=/wp-app

mkdir $rootdir

# install bedrock structure
cd $rootdir
composer create-project roots/bedrock

# install sage theme
cd bedrock/web/app/themes
composer create-project roots/sage sage

cd $rootdir/bedrock
rm -rf /.env
cp /docker-setup/.env .

tail -F anything