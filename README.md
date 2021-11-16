# PostgreSQL_binaries
Based on PostgreSQL Community Source，build and verify  tarball/ RPM binaries for Power AIX/Linux ppc64le/ppc64le, release binaries for popular versions.

# 说明
本仓库从社区下载PostgreSQL主流源码版本，维护PostgreSQL on Power上经过优化、验证的编译脚本， 并通过Tags/Releases中提供编译好的二进制RPM或者TARBALL 软件包.
 
# 示例
* [scripts/src/12.5/GET_SOURCE.links.sh](https://github.com/DBres4Power/PostgreSQL_binaries/blob/main/scripts/src/12.5/GET_SOURCE.links.sh) ，内容是下载PostgreSQL 12.5源码的链接
 
* [scripts/build_on_rhel7_by_devtoolset/12.5/README.BUILD.RPMS.txt](https://github.com/DBres4Power/PostgreSQL_binaries/blob/main/scripts/build_on_rhel7_by_devtoolset/12.5/README.BUILD.RPMS.txt) 在Redhat 7环境，采用devtoolset gcc编译PostgreSQL 12.5二进制RPM包的过程

* [scripts/build_on_rhel7_by_devtoolset/12.5/README.BUILD.TAR.txt](https://github.com/DBres4Power/PostgreSQL_binaries/blob/main/scripts/build_on_rhel7_by_devtoolset/12.5/README.BUILD.TAR.txt) 在Redhat 7环境，采用devtoolset gcc编译PostgreSQL 12.5二进制TAR包的过程

* [scripts/build_on_rhel8_by_devtoolset/13.4/README.BUILD.RPMS.txt](https://github.com/DBres4Power/PostgreSQL_binaries/blob/main/scripts/build_on_rhel8_by_devtoolset/13.4/README.BUILD.RPMS.txt) 在Redhat 8环境，采用devtoolset gcc编译PostgreSQL 13.4二进制RPM包的过程

* [scripts/build_on_rhel8_by_devtoolset/13.4/README.BUILD.TAR.txt](https://github.com/DBres4Power/PostgreSQL_binaries/blob/main/scripts/build_on_rhel8_by_devtoolset/13.4/README.BUILD.TAR.txt) 在Redhat 8环境，采用devtoolset gcc编译PostgreSQL 13.4二进制TAR包的过程
 
* [Releases/Tags build_on_rhel7_by_devtoolset](https://github.com/DBres4Power/PostgreSQL_binaries/releases/tag/v12.5_built_on_rhel7_by_devtoolset) 提供在RedHat/CentOS 7下采用devtoolset gcc编译好的PostgreSQL 12.5二进制RPM与TARBALL 软件包

* [Releases/Tags PostgreSQL_13.4_built_on_RedHat_8_by_gcc_toolset_9](https://github.com/DBres4Power/PostgreSQL_binaries/releases/tag/PostgreSQL_13.4_built_on_RedHat_8_by_gcc_toolset_9) 提供在RedHat/CentOS 8下采用devtoolset-9 gcc编译好的PostgreSQL 13.4二进制RPM与TARBALL 软件包

* 因Linux系统自带gcc版本都比较老，因此采用较新的devtoolset gcc，以便能充分发挥软/硬件新功能和特性；有些还还提供了用Advanced Toolchain编译的脚本和软件包

* 将视需求不断新增其他发行Linux版本下各PostgreSQL主流版本软件包
