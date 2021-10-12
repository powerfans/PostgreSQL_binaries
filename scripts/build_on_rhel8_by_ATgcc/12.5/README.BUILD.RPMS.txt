Build on K1 Power9 Linux, RedHat 7.6 (Kernel 4.18.0-305.el8.ppc64le) with advance-toolchain-at12.0

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
# yum -y install jemalloc jemalloc-devel make bison zlib-devel bzip2-devel bzip2 libevent libevent-devel e2fsprogs-devel llvm-devel  \
   libcurl-devel apr-devel libxslt-devel libxml2-devel  openssl-devel pam-devel krb5-devel  perl perl-devel flex docbook-dtds docbook-style-xsl \
   openldap-devel bison perl-ExtUtils-Embed systemd-devel python2-devel python3-devel readline-devel ncurses-devel lz4 lz4-devel \
   clang clang-devel libicu libicu-devel libevent-devel libaio-devel libtirpc-devel uuid libuuid libuuid-devel uuid-devel \
   java-1.8.0-openjdk java-1.8.0-openjdk-devel numad numactl-devel nmon wget git iotop dstat perf

Install advance-toolchain-at12.0
# yum install advance-toolchain-at12.0
# export PATH=/opt/at12.0/bin:$PATH
# type gcc
gcc is /opt/at12.0/bin/gcc
[root@db1 src]# gcc --version
gcc (GCC) 8.3.1 20190304 (Advance-Toolchain-at12.0) [revision 269374]

### Default %{optflags} is not optimized; use native other than power8; define atpath and atstring; pgdg-srpm-macros is not required
# rpm -Uvh postgresql12-12.5-1PGDG.rhel7.src.rpm
# cd /root/rpmbuild/SPECS
# sed -i 's/power8/native/g; s/^%pgdg_set_ppc64le.*//g' postgresql-12.spec
# sed -i 's/%global prevmajorversion 11/%global pgmajorversion 12\n%global prevmajorversion 11/g' postgresql-12.spec
# sed -i 's/pgdg-srpm-macros//g' postgresql-12.spec
# rpmbuild -v -bb postgresql-12.spec --define='optflags -O3 -mcpu=native -mtune=native -mcmodel=large' --define='atpath /opt/at11.0' --define='atstring at11.0' 2>&1 | tee build.log




