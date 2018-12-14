<?php
  require_once($_SERVER['DOCUMENT_ROOT'] . "/flexmls/flexmlsAPI.php");

  global $auth;

  $api = new flexmlsAPI("cab_westerlund_key_1", "5lCZrVg8d4uYSviaNIN4t");
  $api->SetApplicationName("Diamante-MLS-Search/1.0");
  $api->SetDeveloperMode(false);
  $auth = $api->Authenticate();
  //if ($auth === false) api_error_thrown($api);

  function getListings($params) {
    $listings = null;
    if ($GLOBALS['auth']) {
      $listings = $api->GetListings($params);
    }
    return $listings;
  }

  function getMyListings($params) {
    $listings = null;
    if ($GLOBALS['auth']) {
      $listings = $apos->getMyListings($params);
    }
    return $listings;
  }
?>