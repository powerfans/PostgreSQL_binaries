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
# yum -y install jemalloc jemalloc-devel make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel \
  libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex \
  openldap-devel bison perl-ExtUtils-Embed python python-devel python3 python3-devel readline-devel ncurses-devel lz4 lz4-devel \
  clang clang-devel libicu libicu-devel ibevent-devel libaio-devel libtirpc-devel \
  java-1.8.0-openjdk java-1.8.0-openjdk-devel numad numactl-devel nmon wget git iotop dstat perf

Install devtoolset-7
# yum install devtoolset-7
source /opt/rh/devtoolset-7/enable
# type gcc
gcc is /opt/rh/devtoolset-7/root/usr/bin/gcc
# gcc --version 
gcc (GCC) 7.3.1 20180303 (Red Hat 7.3.1-5)

### Default %{optflags} is not optimized.
# rpm -Uvh postgresql11-11.10-1PGDG.rhel7.src.rpm
# cd /root/rpmbuild/SPECS
# sed -i 's/power8/native/g; s/atpath/devtoolsetpath/g; s/^%pgdg_set_ppc64le.*//g' postgresql-11.spec
# sed -i 's/%global prevmajorversion 10/%global pgmajorversion 11\n%global prevmajorversion 10/g' postgresql-11.spec
# sed -i 's/.*advance-toolchain.*//g; s/pgdg-srpm-macros//g' postgresql-11.spec
# rpmbuild -v -bb postgresql-11.spec --define='optflags -O3 -mcpu=native -mtune=native -mcmodel=large' --define='devtoolsetpath /opt/rh/devtoolset-7/root/usr' 2>&1 | tee build.log




