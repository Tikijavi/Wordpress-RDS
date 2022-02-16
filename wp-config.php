<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'javieselmillor' );

/** MySQL database username */
define( 'DB_USER', 'javier' );

/** MySQL database password */
define( 'DB_PASSWORD', '1q2w3e4R' );

/** MySQL hostname */

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '|9-y#JVf033?j.:c-$GR41!?0^Bnf<MN3Lx|Yn=@DChG</pohAU=N@MbvDzD:lFG' );
define( 'SECURE_AUTH_KEY',  '$xb; _@(qa<TL*rwuilQcakeRRM=;CZYQ{qV@JYmH,uf3g-k&Oa=xU3Kdr}pB=9y' );
define( 'LOGGED_IN_KEY',    '3;Bsp=[Ztm r}S|ut0S^>%*7_C~0v<0 6?ev4>}EFTAiC/sSc}^z@!P^@tpve&?P' );
define( 'NONCE_KEY',        '[^+AYR0&p<r*eYGe$6A=GBdGa#sEC ,IZNp8xwWQ86=/Mv17m>zW[OWg_8E)1h@)' );
define( 'AUTH_SALT',        'SuTT;t>+!{K5xE6JU[1w~&LfSJ_lipY/wo]??R9PhljGq/47Es1F<!JDos?q4 ZQ' );
define( 'SECURE_AUTH_SALT', '#.f-T/!lOfvXf`6@5Odlf~a,M~*-]7Mr1}!E/_?w]N+#7bkh 1?wnov4 B-Inw>S' );
define( 'LOGGED_IN_SALT',   '5S&ZOxT~X|Doyee:3Wi^gn%Fkf&izzyirC4OU&X~$<5_q>.+lvjOAs1Thc[f~&62' );
define( 'NONCE_SALT',       'Syr(2x;Ynt-A13P,t*L9$nCuPCy]>87G}`FFSUU-@htyF>j&*]!HI2`rm2CGf)0>' );

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
