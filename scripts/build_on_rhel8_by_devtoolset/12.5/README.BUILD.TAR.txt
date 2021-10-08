Build on K1 Power9 Linux, RedHat 8.4 (Kernel 4.18.0-305.el8.ppc64le) with devtoolset-10.

### 1. About Build ENV #########################################################################################

# lscpu |grep -i arch
Architecture:          ppc64le
Model name:            POWER9 (architected), altivec supported

# uname -r
4.18.0-305.el8.ppc64le

# uname -m
ppc64le

### 2. Build postgres ##########################################################################################

Install dependencies
# yum -y install jemalloc jemalloc-devel make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel e2fsprogs-devel llvm-devel llvm-toolset \
   libcurl-devel apr-devel libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex docbook-dtds docbook-style-xsl \
   openldap-devel bison perl-ExtUtils-Embed systemd-devel python2-devel python3-devel readline-devel ncurses-devel lz4 lz4-devel \
   clang clang-devel libicu libicu-devel libevent-devel libaio-devel libtirpc-devel uuid libuuid libuuid-devel uuid-devel \
   java-1.8.0-openjdk java-1.8.0-openjdk-devel numad numactl-devel nmon wget git iotop dstat perf

Install devtoolset-10
# yum install gcc-toolset-10
source  /opt/rh/gcc-toolset-10/enable
# type gcc
gcc is /opt/rh/gcc-toolset-10/root/usr/bin/gcc
# gcc --version
gcc (GCC) 10.2.1 20201112 (Red Hat 10.2.1-8)

# tar zxvf postgresql-12.5.tar.gz
# cd postgresql-12.5
# CC=gcc \
CXX=g++ \
CPP=cpp \
CFLAGS="  -O3 -mcpu=native -mtune=native -mcmodel=large" \
CXXFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large" \
CPPFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large" \
LDFLAGS='-ljemalloc ' \
./configure --prefix=/opt/postgres/12.5 \
     --with-blocksize=8 --with-segsize=1 --with-wal-blocksize=8 --with-openssl --with-uuid=ossp --with-libxml --with-libxslt  \
2>&1 |tee config.log

make -j32 && make install
cd contrib && make  && make install

# cd /opt/postgres
# tar zcf postgresql12-server-12.5-1PGDG.el7a.ppc64le.tar.gz ./12.5
