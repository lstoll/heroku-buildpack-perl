#!/bin/bash

# Need libperl
apt-get install -y libperl-dev

# Clean up
rm -rf /app/sw
mkdir /app/sw

cd /tmp

echo '---> Fetching Apache2'
wget --progress=dot:mega http://mirror.metrocast.net/apache/httpd/httpd-2.2.21.tar.gz

echo '---> Building Apache2'
tar -zxvf httpd-2.2.21.tar.gz
cd httpd-2.2.21
./configure --prefix=/app/httpd --enable-rewrite
make
make install

cd /tmp
echo '---> Fetching mod_perl'
wget --progress=dot:mega http://perl.apache.org/dist/mod_perl-2.0.5.tar.gz
echo '---> Building mod_perl'
tar -zxvf mod_perl-2.0.5.tar.gz
cd mod_perl-2.0.5
perl Makefile.PL MP_AP_PREFIX=/app/httpd PREFIX=/app/perl #MP_APXS=/app/sw/apache/bin/apxs MP_AP_PREFIX=/app/sw/apache2/
make
make test
make install

echo '---> Bundling httpd/mod_perl'
cd /app
tar -zcvf /vagrant/httpd_2.2.21-mod_perl_2.0.5.tar.gz httpd perl

echo '---> DONE'
