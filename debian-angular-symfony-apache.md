Installation https

`wget https://dl.eff.org/certbot-auto && chmod a+x ./certbot-auto && ./certbot-auto`

.htaccess angular
```
$ a2enmod rewrite 
$ nano .htaccess
RewriteEngine On
    # If an existing asset or directory is requested go to it as it is
    RewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} -f [OR]
    RewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} -d
    RewriteRule ^ - [L]
    # If the requested resource doesn't exist, use index.html
RewriteRule ^ /index.html
```

Virtualhost angular *443 sy *80
```
        <Directory /path/to/angular/project/>
                Options Indexes FollowSymLinks
                AllowOverride all
                Order Deny,Allow
                Deny from all
                Allow from all
        </Directory>
```
Token symfony not found + redirect non www to www
```
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
RewriteCond %{HTTP_HOST} !^www\. [NC]
RewriteRule ^(.*)$ https://www.%{HTTP_HOST}/$1 [R=301,L]
RewriteCond %{HTTP:Authorization} ^(.*)
RewriteRule .* - [e=HTTP_AUTHORIZATION:%1]
```
Force redirect https
```
<VirtualHost *:80>
    ServerName www.example.com
    Redirect / https://www.example.com/
</VirtualHost>

```
*Okay*
