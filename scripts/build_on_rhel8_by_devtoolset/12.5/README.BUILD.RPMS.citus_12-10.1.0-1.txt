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
# yum -y install  zstd libzstd libzstd-devel

Install devtoolset-9
# yum install gcc-toolset-9
source  /opt/rh/gcc-toolset-9/enable
# type gcc
gcc is /opt/rh/gcc-toolset-9/root/usr/bin/gcc
# gcc --version
gcc (GCC) 9.2.1 20191120 (Red Hat 9.2.1-2)

### Default %{optflags} is not optimized.
# rpm -Uvh postgresql12-12.5-1PGDG.el8.ppc64le.rpm postgresql12-libs-12.5-1PGDG.el8.ppc64le.rpm postgresql12-devel-12.5-1PGDG.el8.ppc64le.rpm
# ##
# rpm -Uvh citus_12-10.1.0-1.rhel8.src.rpm
# cd /root/rpmbuild/SPECS
# sed -i 's/.*%pgdg_set_ppc64le.*//g; s/pgdg-srpm-macros//g; s/%global sname citus/%global sname citus\n%global pgmajorversion 12\n%global llvm 0/g' citus.spec
# sed -i 's/%configure/export CC=gcc\nexport CFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large"\n%configure/g' citus.spec
# sed -i 's/^%prep/%define _debugsource_template %{nil}\n\n%prep/g' citus.spec
# rpmbuild -v -bb citus.spec --define='pginstdir /usr/pgsql-12' 2>&1 | tee build.log

# cd /root/rpmbuild/RPMS/ppc64le; tar zcf postgresql-citus_12-10.1.0-1.el8a.ppc64le_RPMS.tar.gz *.rpm



