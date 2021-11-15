Build on K1 Power9 Linux, RedHat 8.4 (Kernel 4.18.0-305.el8.ppc64le) with devtoolset-9.

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

Install devtoolset-9
# yum install gcc-toolset-9
source  /opt/rh/gcc-toolset-9/enable
# type gcc
gcc is /opt/rh/gcc-toolset-9/root/usr/bin/gcc
# gcc --version
gcc (GCC) 9.2.1 20191120 (Red Hat 9.2.1-2)

# tar zxvf postgresql-13.1.tar.gz
# cd postgresql-13.1
# CC=gcc \
CXX=g++ \
CPP=cpp \
CFLAGS="  -O3 -mcpu=native -mtune=native -mcmodel=large" \
CXXFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large" \
CPPFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large" \
LDFLAGS='-ljemalloc ' \
./configure --prefix=/opt/postgres/13.1 \
     --with-blocksize=8 --with-segsize=1 --with-wal-blocksize=8 --with-openssl --with-uuid=ossp --with-libxml --with-libxslt \
2>&1 |tee  config.log

make -j32 && make install
cd contrib && make  && make install

# cd /opt/postgres;  tar zcf postgresql13-server-13.1-1PGDG.el8.ppc64le.tar.gz ./13.1
