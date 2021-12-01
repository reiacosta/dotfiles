#! /bin/sh

OPENSSL_VERSION="1.0.1"
CURL_VERSION="7.25.0"

echo 'Building OpenSSL ${OPENSSL_VERSION} and curl ${CURL_VERSION} for 64 bit OSX platforms'
CDPATH=""
mkdir -p /usr/local/bt
cd /usr/local/bt
rm -f *.tar.gz *.tar.gz.* *.tar.bz2 *.tar.bz2.*

##### openssl ######
# wget http://www.openssl.org/source/openssl-0.9.8n.tar.gz
wget "http://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz"
tar xvfz "openssl-${OPENSSL_VERSION}.tar.gz"

cd "openssl-${OPENSSL_VERSION}"
./Configure darwin64-x86_64-cc no-asm no-krb5 zlib shared --prefix=/usr/local/bt
make
make install

##### curl #########
cd /usr/local/bt
wget "http://curl.haxx.se/download/curl-${CURL_VERSION}.tar.bz2"
tar xvfj "curl-${CURL_VERSION}.tar.bz2"
cd "curl-${CURL_VERSION}"
PKG_CONFIG_PATH=/usr/local/bt/lib/pkgconfig ./configure --prefix=/usr/local/bt
make
make install

#### pycurl ###########
echo '######################################################################################'
echo 'OpenSSL and Curl have been rebuilt and installed at'
echo '    /usr/local/bt'
echo 'Now you need to load your python environment and reinstall pycurl'
echo '   pip uninstall pycurl'
echo "   ARCHFLAGS='-arch x86_64'  /usr/local/share/python/pip install --install-option='--curl-config=/usr/local/bt/bin/curl-config' pycurl"
echo '######################################################################################'
