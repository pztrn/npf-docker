FROM code.pztrn.name/containers/mirror/alpine:3.16.1

RUN apk add --no-cache nginx php8-bcmath php8-bz2 php8-common php8-ctype php8-curl php8-dba php8-dom php8-embed php8-enchant php8-exif php8-ffi php8-fileinfo php8-fpm php8-ftp php8-gd php8-gettext php8-gmp php8-iconv php8-imap php8-intl php8-json php8-ldap php8-mbstring php8-mysqlnd php8-odbc php8-opcache php8-openssl php8-pcntl php8-pdo php8-pdo_dblib php8-pdo_mysql php8-pdo_odbc php8-pdo_pgsql php8-pdo_sqlite php8-pear php8-pgsql php8-phar php8-posix php8-pspell php8-session php8-shmop php8-simplexml php8-snmp php8-soap php8-sockets php8-sodium php8-sqlite3 php8-sysvmsg php8-sysvshm php8-tidy php8-tokenizer php8-xml php8-xmlreader php8-xmlwriter php8-xsl php8-zip s6

COPY configuration /etc/

ENTRYPOINT ["/bin/s6-svscan", "/etc/s6"]
