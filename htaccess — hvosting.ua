RewriteEngine on

RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{SERVER_NAME}/$1 [R,L]

# Redirect to domain without www.
RewriteCond %{HTTPS} off
RewriteCond %{HTTP_HOST} ^www\.(.*)$ [NC]
RewriteRule .* https://%1%{REQUEST_URI} [R=301,L]
# Same for HTTPS:
RewriteCond %{HTTPS} on
RewriteCond %{HTTP_HOST} ^www\.(.*)$ [NC]
RewriteRule .* https://%1%{REQUEST_URI} [R=301,L]

# Add Caching.
<FilesMatch ".(ico|jpg|jpeg|png|gif|js|css|swf)$">
    Header set Cache-Control "max-age=300"
</FilesMatch>

# Custom error pages.
ErrorDocument 404 /404.html

# Prevent viewing of htaccess file.
<Files .htaccess>
    order allow,deny
    deny from all
</Files>

# Prevent directory listings
Options All -Indexes

# Compress text, html, javascript, css, xml:
AddOutputFilterByType DEFLATE text/plain
AddOutputFilterByType DEFLATE text/html
AddOutputFilterByType DEFLATE text/xml
AddOutputFilterByType DEFLATE text/css
AddOutputFilterByType DEFLATE application/xml
AddOutputFilterByType DEFLATE application/xhtml+xml
AddOutputFilterByType DEFLATE application/rss+xml
AddOutputFilterByType DEFLATE application/javascript
AddOutputFilterByType DEFLATE application/x-javascript
