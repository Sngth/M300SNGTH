<IfModule mod_ssl.c>
<VirtualHost *:443>

        #  General setup for the virtual host
        DocumentRoot "/var/www"
        ServerName my-nextcloud.sngth.net
        ServerAdmin webmaster@sngth.ch
        ErrorLog /var/log/apache2/my-nextcloud.sngth.ch_error.log
        TransferLog /var/log/apache2/my-nextcloud.sngth.ch_access.log

        Include /etc/apache2/dstk-all-sites-incl.conf

        # see https://doc.owncloud.org/server/8.1/admin_manual/configuration_server/harden_server.html
        Header always add Strict-Transport-Security "max-age=15768000"

        # RewriteLogLevel 3

        RewriteEngine On
        ProxyRequests Off

        ProxyPass        / http://nextcloud.sngth.ch:8094/
        ProxyPassReverse / http://nextcloud.sngth.ch:8094/

        SSLCertificateFile /etc/letsencrypt/live/my-nextcloud.sngth.ch/fullchain.pem
        SSLCertificateKeyFile /etc/letsencrypt/live/my-nextcloud.sngth.ch/privkey.pem
        Include /etc/letsencrypt/options-ssl-apache.conf
</VirtualHost>
</IfModule>