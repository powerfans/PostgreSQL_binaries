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

Install dependencies
<<<<<<< HEAD
# yum -y install jemalloc jemalloc-devel make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel \
  libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex \
  openldap-devel bison perl-ExtUtils-Embed python python-devel python3 python3-devel readline-devel ncurses-devel lz4 lz4-devel \
  clang clang-devel libicu libicu-devel libevent-devel libaio-devel libtirpc-devel \
=======
# yum -y install jemalloc jemalloc-devel cmake3 make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel \
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


### Default %{optflags} is not optimized; use native other than power8; define atpath and atstring; pgdg-srpm-macros is not required
# rpm -Uvh postgresql11-11.10-1PGDG.rhel7.src.rpm
# cd /root/rpmbuild/SPECS
# sed -i 's/power8/native/g; s/^%pgdg_set_ppc64le.*//g' postgresql-11.spec
# sed -i 's/%global prevmajorversion 10/%global pgmajorversion 11\n%global prevmajorversion 10/g' postgresql-11.spec
# sed -i 's/pgdg-srpm-macros//g' postgresql-11.spec
# rpmbuild -v -bb postgresql-11.spec --define='optflags -O3 -mcpu=native -mtune=native -mcmodel=large' --define='atpath /opt/at11.0' --define='atstring at11.0' 2>&1 | tee build.log

# cd /root/rpmbuild/RPMS/ppc64le; tar zcf postgresql11-11.10-1PGDG.el7a.ppc64le_at11gcc_RPMS.tar.gz *.rpm


