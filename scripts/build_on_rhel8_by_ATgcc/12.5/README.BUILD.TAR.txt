Build on K1 Power9 Linux, RedHat 8.3 (Kernel 4.18.0-240.el8.ppc64le) with advance-toolchain-at13.0

### 1. About Build ENV #########################################################################################

# lscpu |grep -i arch
Architecture:          ppc64le
Model name:            POWER9 (architected), altivec supported

# uname -r
4.18.0-240.el8.ppc64le

# uname -m
ppc64le

### 2. Build postgres ##########################################################################################

Install dependencies
# yum -y install jemalloc jemalloc-devel make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel e2fsprogs-devel llvm-devel  \
   libcurl-devel apr-devel libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex docbook-dtds docbook-style-xsl \
   openldap-devel bison perl-ExtUtils-Embed systemd-devel python2-devel python3-devel readline-devel ncurses-devel lz4 lz4-devel \
   clang clang-devel libicu libicu-devel libevent-devel libaio-devel libtirpc-devel uuid libuuid libuuid-devel uuid-devel \
   java-1.8.0-openjdk java-1.8.0-openjdk-devel numad numactl-devel nmon wget git iotop dstat perf

Install advance-toolchain-at13.0
# yum install advance-toolchain-at13.0
# export PATH=/opt/at13.0/bin:$PATH
# type gcc
gcc is /opt/at13.0/bin/gcc
# gcc --version
gcc (GCC) 9.2.1 20190813 (Advance-Toolchain-at13.0) [revision 274392]
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# tar zxvf postgresql-12.5.tar.gz
# cd postgresql-12.5
# CC=gcc \
CXX=g++ \
CPP=cpp \
CFLAGS="  -O3 -mcpu=native -mtune=native -mcmodel=large" \
CXXFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large" \
CPPFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large" \
LDFLAGS='-ljemalloc ' \
./configure --prefix=/opt/postgres_at/12.5 \
     --with-blocksize=8 --with-segsize=1 --with-wal-blocksize=8 --with-openssl --with-uuid=ossp --with-libxml --with-libxslt \
2>&1 |tee config.log

make -j32 && make install
cd contrib && make  && make install

# cd /opt/postgres_at && tar zcf postgresql12-server-12.5-1PGDG.el8a.ppc64le.at13gcc.tar.gz ./12.5

