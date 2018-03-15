# install_wordpress.sh
# Run this function in the web root folder
# Works for apache

wget http://wordpress.org/latest.tar.gz;
tar xvfz latest.tar.gz;
rm latest.tar.gz;
mv wordpress wp;
rm -rf wp/wp-content/plugins/akismet;
echo 'User-agent: *' > robots.txt;
echo 'Allow: /' > robots.txt;
sed -i 's/wp-blog-header.php/wp\/wp-blog-header.php/g' index.php;
printf '.htaccess\nwp/wp-config.php\n' >> .gitignore;

cat <<EOF >> .htaccess
# BEGIN WordPress
	<IfModule mod_rewrite.c>
	RewriteEngine On
	RewriteBase /
	RewriteRule ^index\.php$ - [L]
	RewriteCond %{REQUEST_FILENAME} !-f
	RewriteCond %{REQUEST_FILENAME} !-d
	RewriteRule . /index.php [L]
	</IfModule>
# END WordPress
EOF

cat <<EOF >> index.php
<?php
/**
 * Front to the WordPress application. This file doesn't do anything, but loads
 * wp-blog-header.php which does and tells WordPress to load the theme.
 *
 * @package WordPress
 */

/**
 * Tells WordPress to load the WordPress theme and output it.
 *
 * @var bool
 */
define('WP_USE_THEMES', true);

/** Loads the WordPress Environment and Template */
require('./wp/wp-blog-header.php');
?>
EOF

cat <<EOF >> README.md
# After install instructions
Thank you for using this script to install Wordpress!

## Next steps:

- Create a database
- Add the database name and credentials to wp/wp-config.php
- Go to your site and finish the Wordpress install script.

EOF
