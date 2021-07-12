FROM alpine:3.14

RUN apk add --no-cache nginx php7-bcmath php7-bz2 php7-common php7-ctype php7-curl php7-dba php7-dom php7-embed php7-enchant php7-exif php7-ffi php7-fileinfo php7-fpm php7-ftp php7-gd php7-gettext php7-gmp php7-iconv php7-imap php7-intl php7-json php7-ldap php7-mbstring php7-mysqlnd php7-odbc php7-opcache php7-openssl php7-pcntl php7-pdo php7-pdo_dblib php7-pdo_mysql php7-pdo_odbc php7-pdo_pgsql php7-pdo_sqlite php7-pear php7-pgsql php7-phar php7-posix php7-pspell php7-session php7-shmop php7-simplexml php7-snmp php7-soap php7-sockets php7-sodium php7-sqlite3 php7-sysvmsg php7-sysvshm php7-tidy php7-tokenizer php7-xml php7-xmlreader php7-xmlrpc php7-xmlwriter php7-xsl php7-zip s6

COPY configuration/* /etc/

ENTRYPOINT ["/bin/s6-svscan", "/etc/s6"]
