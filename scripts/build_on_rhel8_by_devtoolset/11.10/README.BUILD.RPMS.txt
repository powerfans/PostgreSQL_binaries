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

### Default %{optflags} is not optimized.
# rpm -Uvh postgresql11-11.10-2PGDG.rhel8.src.rpm
# cd /root/rpmbuild/SPECS
# sed -i 's/power8/native/g; s/atpath/devtoolsetpath/g; s/^%pgdg_set_ppc64le.*//g' postgresql-11.spec
# sed -i 's/%global prevmajorversion 10/%global pgmajorversion 11\n%global prevmajorversion 10/g' postgresql-11.spec
# sed -i 's/.*advance-toolchain.*//g; s/pgdg-srpm-macros//g' postgresql-11.spec
# sed -i 's/^%prep/%define _debugsource_template %{nil}\n\n%prep/g' postgresql-11.spec
# rpmbuild -v -bb postgresql-11.spec --define='optflags -O3 -mcpu=native -mtune=native -mcmodel=large' --define='devtoolsetpath /opt/rh/gcc-toolset-10/root/usr' 2>&1 | tee build.log

# cd /root/rpmbuild/RPMS/ppc64le; tar zcf postgresql11-11.10-1PGDG.el8a.ppc64le_RPMS.tar.gz *.rpm



