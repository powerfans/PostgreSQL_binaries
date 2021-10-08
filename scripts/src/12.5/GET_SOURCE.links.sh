### https://www.postgresql.org/ftp/source/
### https://yum.postgresql.org/rpmchart/
### https://https://yum.postgresql.org/srpm-packages/

##1.TAR source
wget -c https://ftp.postgresql.org/pub/source/v12.5/postgresql-12.5.tar.gz --no-check-certificate

##2. SRC RPM
wget -c https://yum.postgresql.org/srpms/12/redhat/rhel-7-ppc64le/postgresql12-12.5-1PGDG.rhel7.src.rpm --no-check-certificate
wget -c https://yum.postgresql.org/srpms/12/redhat/rhel-8-ppc64le/postgresql12-12.5-1PGDG.rhel8.src.rpm --no-check-certificate

wget -c https://yum.postgresql.org/srpms/12/redhat/rhel-7-ppc64le/postgresql-jdbc-42.2.8-1.rhel7.src.rpm
wget -c https://yum.postgresql.org/srpms/12/redhat/rhel-7-ppc64le/postgresql12-odbc-11.01.0000-1PGDG.rhel7.1.src.rpm
wget -c https://yum.postgresql.org/srpms/12/redhat/rhel-7-ppc64le/postgresql12-tcl-2.7.4-1.rhel7.src.rpm
wget -c https://yum.postgresql.org/srpms/12/redhat/rhel-7-ppc64le/citus_12-9.4.1-1.rhel7.src.rpm
wget -c https://yum.postgresql.org/srpms/12/redhat/rhel-7-ppc64le/pgdg-srpm-macros-1.0.0-1.rhel7.src.rpm


## get ALL SRC RPM
## wget -c -r -nd -k -L -np -nH  https://yum.postgresql.org/srpms/12/redhat/rhel-7-ppc64le/
lftp https://yum.postgresql.org/srpms/12/redhat/ <<- EOF
mirror -c -e -n -L -P 8 rhel-7-ppc64le
EOF


