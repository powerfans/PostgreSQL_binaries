Build on K1 Power9 Linux, RedHat 7.6 (Kernel 4.14.0-115.8.1.el7a.ppc64le) with devtoolset-7.

### 1. About Build ENV #########################################################################################

# lscpu |grep -i arch
Architecture:          ppc64le
Model name:            POWER9 (architected), altivec supported

# uname -r
4.14.0-115.8.1.el7a.ppc64le

# uname -m
ppc64le

### 2. Build RPMS for postgres #################################################################################

Install dependencies
# yum -y install jemalloc jemalloc-devel cmake3 make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel \
<<<<<<< HEAD
  libcurl-devel apr-devel libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex \
  openldap-devel bison perl-ExtUtils-Embed python python-devel python3 python3-devel readline-devel ncurses-devel lz4 lz4-devel \
  clang clang-devel libicu libicu-devel libevent-devel libaio-devel libtirpc-devel \
  java-1.8.0-openjdk java-1.8.0-openjdk-devel numad numactl-devel nmon wget git iotop dstat perf
=======
   libcurl-devel apr-devel libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex \
   openldap-devel bison python3 python3-devel readline-devel ncurses-devel lz4 lz4-devel \
   clang clang-devel libicu libicu-devel libevent-devel libaio-devel libtirpc-devel uuid libuuid libuuid-devel uuid-devel \
   java-1.8.0-openjdk java-1.8.0-openjdk-devel numad numactl-devel git iotop dstat perf
>>>>>>> main

Install devtoolset-7
# yum install devtoolset-7
source /opt/rh/devtoolset-7/enable
# type gcc
gcc is /opt/rh/devtoolset-7/root/usr/bin/gcc
# gcc --version 
gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)

### Default %{optflags} is not optimized.
# rpm -Uvh postgresql12-12.5-1PGDG.rhel7.src.rpm
# cd /root/rpmbuild/SPECS
# sed -i 's/power8/native/g; s/atpath/devtoolsetpath/g; s/^%pgdg_set_ppc64le.*//g' postgresql-12.spec
# sed -i 's/%global prevmajorversion 11/%global pgmajorversion 12\n%global prevmajorversion 11/g' postgresql-12.spec
# sed -i 's/.*advance-toolchain.*//g; s/pgdg-srpm-macros//g' postgresql-12.spec
# rpmbuild -v -bb postgresql-12.spec --define='optflags -O3 -mcpu=native -mtune=native -mcmodel=large' --define='devtoolsetpath /opt/rh/devtoolset-7/root/usr' 2>&1 | tee build.log




