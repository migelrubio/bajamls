<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$config['debug'] = '1';
$config['enable_devlog_alerts'] = 'n';
$config['cache_driver'] = 'dummy';
$config['is_system_on'] = 'y';
$config['multiple_sites_enabled'] = 'n';
$config['index_page'] = '';
$config['save_tmpl_files'] = 'y';
// ExpressionEngine Config Items
// Find more configs and overrides at
// https://docs.expressionengine.com/latest/general/system_configuration_overrides.html

$config['app_version'] = '4.3.4';
$config['encryption_key'] = 'c27bcef640fb4b966395a187e2047b9f9b6af988';
$config['session_crypt_key'] = '5ca17441703d75c334de01fe59b2b008d9712262';
if ($_SERVER['HTTP_HOST'] == "bajamls.local") {
	$config['database'] = array(
		'expressionengine' => array(
			'hostname' => 'localhost',
			'database' => 'bajamls',
			'username' => 'root',
			'password' => 'root',
			'dbprefix' => 'exp_',
			'char_set' => 'utf8mb4',
			'dbcollat' => 'utf8mb4_unicode_ci',
			'port'     => ''
		),
	);
	$config['base_path'] = "/var/www/bajamls/";
} else {
	$config['database'] = array(
		'expressionengine' => array(
			'hostname' => 'localhost',
			'database' => 'diamante_realtors',
			'username' => 'diamante_root',
			'password' => 'ihCytmDUQrra',
			'dbprefix' => 'exp_',
			'char_set' => 'utf8mb4',
			'dbcollat' => 'utf8mb4_unicode_ci',
			'port'     => ''
		),
	);
}

// EOF