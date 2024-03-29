Build on K1 Power9 Linux, RedHat 7.9 (Kernel 4.18.0-193.28.1.el7.ppc64le) with devtoolset-9.

### 1. About Build ENV #########################################################################################

# lscpu |grep -i arch
Architecture:          ppc64le
Model name:            POWER9 (architected), altivec supported

# uname -r
4.18.0-193.28.1.el7.ppc64le

# uname -m
ppc64le

### 2. Build postgres ##########################################################################################

Install dependencies
# yum -y install jemalloc jemalloc-devel cmake3 make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel \
   libcurl-devel apr-devel libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex \
   openldap-devel bison perl-ExtUtils-Embed python python-devel python3 python3-devel readline-devel ncurses-devel lz4 lz4-devel \
   clang clang-devel libicu libicu-devel libevent-devel tcl tcl-devel libaio-devel libtirpc-devel uuid libuuid libuuid-devel uuid-devel \
   java-1.8.0-openjdk java-1.8.0-openjdk-devel numad numactl-devel nmon wget git iotop dstat perf

Install devtoolset-9
# yum install devtoolset-9
source /opt/rh/devtoolset-9/enable
# type gcc
gcc is /opt/rh/devtoolset-9/root/usr/bin/gcc
# gcc --version 
gcc (GCC) 9.3.1 20200408 (Red Hat 9.3.1-2)

# tar zxvf postgresql-15.1.tar.gz
# cd postgresql-15.1
# CC=gcc \
CXX=g++ \
CPP=cpp \
CFLAGS="  -O3 -mcpu=native -mtune=native -mcmodel=large" \
CXXFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large" \
CPPFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large" \
LDFLAGS='-ljemalloc ' \
./configure --prefix=/opt/postgres/15.1 \
     --with-blocksize=8 --with-segsize=1 --with-wal-blocksize=8 --with-openssl --with-uuid=ossp --with-libxml --with-libxslt \
2>&1 |tee  config.log

make -j32 && make install
cd contrib && make  && make install

# cd /opt/postgres
# tar zcf postgresql15-server-15.1-1PGDG.el7a.ppc64le.tar.gz ./15.1
