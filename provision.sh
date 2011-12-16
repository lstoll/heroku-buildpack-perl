#!/bin/bash

apt-get install -y libperl-dev curl

# Cleanup
echo '---> Cleaning up..'
rm -rf /app
rm -rf /lp

mkdir -p /lp/build
mkdir -p /tmp/lp_cache

cp -R /vagrant/* /lp
mv /lp/sample_app/* /lp/build/
rm -rf /lp/sample_app

cd /tmp

echo '---> Running detect..'
/lp/bin/detect /lp/build
echo '---> Running compile..'
/lp/bin/compile /lp/build /tmp/lp_cache
echo '---> Running release..'
/lp/bin/release
echo '---> Moving result in to /app..'
mv /lp/build /app
chown -R vagrant:vagrant /app
