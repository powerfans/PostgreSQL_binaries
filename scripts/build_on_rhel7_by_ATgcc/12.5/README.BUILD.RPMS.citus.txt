Build on K1 Power9 Linux, RedHat 7.6 (Kernel 4.14.0-115.8.1.el7a.ppc64le) with advance-toolchain-at11.0

### 1. About Build ENV #########################################################################################

# lscpu |grep -i arch
Architecture:          ppc64le
Model name:            POWER9 (architected), altivec supported

# uname -r
4.14.0-115.8.1.el7a.ppc64le

# uname -m
ppc64le

### 2. Build RPMS for postgres #################################################################################

Install dependencies, including dependencies for both postgres and citus
# yum -y install jemalloc jemalloc-devel cmake3 make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel \
<<<<<<< HEAD
  libcurl-devel apr-devel libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex \
  openldap-devel bison perl-ExtUtils-Embed python python-devel python3 python3-devel readline-devel ncurses-devel lz4 lz4-devel \
  clang clang-devel libicu libicu-devel libevent-devel libaio-devel libtirpc-devel \
=======
   libcurl-devel apr-devel libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex \
   openldap-devel bison python python-devel python3 python3-devel readline-devel ncurses-devel lz4 lz4-devel \
   clang clang-devel libicu libicu-devel libevent-devel libaio-devel libtirpc-devel uuid libuuid libuuid-devel uuid-devel \
>>>>>>> main
  java-1.8.0-openjdk java-1.8.0-openjdk-devel numad numactl-devel nmon wget git iotop dstat perf

Install advance-toolchain-at11.0
# yum install advance-toolchain-at11.0
# export PATH=/opt/at11.0/bin:$PATH
# type gcc
gcc is /opt/at11.0/bin/gcc
[root@db1 src]# gcc --version
gcc (GCC) 7.4.1 20191016 (Advance-Toolchain-at11.0) [revision 277075]

### Default %{optflags} is not optimized.
# rpm -Uvh citus_12-9.4.1-1.rhel7.src.rpm
# cd /root/rpmbuild/SPECS
# sed -i 's/.*%pgdg_set_ppc64le.*//g; s/pgdg-srpm-macros//g; s/%global sname citus/%global sname citus\n%global pgmajorversion 12/g' citus.spec
# sed -i 's/%configure/export CC=gcc\nexport CFLAGS="-O3 -mcpu=native -mtune=native -mcmodel=large"\n%configure/g' citus.spec
### Build citus with postgresql tarball binaries in /opt/postgres_at/12.5 
### sed -i 's/postgresql%{pgmajorversion}-devel//g; s/.*postgresql%{pgmajorversion}-server//g' citus.spec
### rpmbuild -v -bb citus.spec --define='pginstdir /opt/postgres_at/12.5' 2>&1 | tee build.log 
# 
### Build citus with postgresql RPM binaries
# rpm -Uvh postgresql12-12.5-1PGDG.el7a.ppc64le.rpm postgresql12-libs-12.5-1PGDG.el7a.ppc64le.rpm postgresql12-devel-12.5-1PGDG.el7a.ppc64le.rpm
# rpmbuild -v -bb citus.spec --define='pginstdir /usr/pgsql-12' 2>&1 | tee build.log




