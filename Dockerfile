FROM momar/caddy-php

USER 0

ADD https://github.com/vrana/adminer/releases/download/v4.7.0/adminer-4.7.0.php /data/public/adminer.php
ADD https://raw.githubusercontent.com/vrana/adminer/master/plugins/plugin.php /data/public/plugins/
ADD https://github.com/jnvsor/adminer-table-header-scroll/raw/master/table-header-scroll.php /data/public/plugins/
ADD https://gist.github.com/scr4bble/9ee4a9f1405ffc1465f59e03768e2768/raw/241efb913859575c2b178011c8fdbc4081b94feb/readable-dates.php /data/public/plugins/
#ADD https://github.com/pematon/adminer-plugins/raw/master/AdminerLoginServers.php /data/public/plugins/
ADD https://github.com/pematon/adminer-plugins/raw/master/AdminerJsonPreview.php /data/public/plugins/

ADD Caddyfile /data/Caddyfile
ADD index.php /data/public/index.php
ADD adminer-theme/lib/ /data/public

# TODO: MongoDB
RUN apk add --no-cache php7-mysqli php7-pgsql php7-sqlite3 &&\
    chmod -R go-w,+r /data/public &&\
    chown -R root:root /data &&\
    ln -s css/default-blue.css /data/public/adminer.css
USER 1000
