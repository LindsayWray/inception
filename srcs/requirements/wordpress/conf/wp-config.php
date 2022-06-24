<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'user' );
// define( 'DB_USER', getenv('WP_USER') );

/** Database password */
define( 'DB_PASSWORD', 'pw' ); // <- this works
// define( 'DB_PASSWORD', getenv('WP_USER_PW') ); // <- this doesnt work

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );


/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '#PapPh@T..^zRux(hQ~rea4g?B&oXIaO|4T|RY]]qN5B!^!MJo-JPNYp4J`ey}gs');
define('SECURE_AUTH_KEY',  '$zWre<{5juUx%-x{yV@Zk~5-)sW0h:/w#oN-!h55rZ)T29-CnmLbv)PU~ig~m+!I');
define('LOGGED_IN_KEY',    'XXI}.93[-B{_3++kcuAO$Nx,MxacqY]5 !{t<[WaM}FZkUo~vSW;7Ad^5kS@>Iip');
define('NONCE_KEY',        'hg}=G+CK8-RXZwnr Q(vf}og-7h@yg aRY:H|uS>]-@*aYYvjXoWajmKMAIDx[+2');
define('AUTH_SALT',        'I+fJf^e=*_S&_t?im,MWh9[n2u:+o!)),HR+Lw9myu3:9wwPiR`cT|%Y:aXOY5Xx');
define('SECURE_AUTH_SALT', '8WB)3Pb+EC/Hc%<k(%^8j$Q?Ez~#+fR^ JjrP#NG|4CJ}cA)Uc=5ow:Pt4qd$Qj~');
define('LOGGED_IN_SALT',   'p4H-@LQ$[cE>sV[ z^Hm&Mu`O39Cpde]hf{}U2VJE|20*UA5Z&?==!j`Tq}0*rD ');
define('NONCE_SALT',       'R]m#6},IM8dC`H1x^X5aO5kX! ARS+v-=%m}aA5PG3Eks|olUlM fR+dhdnilz-x');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';