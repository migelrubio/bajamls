<?php

  function parse_data($array, $just_keys = false, $bold = true){
    if($array == null)
      return '';
    $result = '';
    $count = 0;
    foreach(new RecursiveIteratorIterator(new RecursiveArrayIterator($array)) as $key => $value){
      if($just_keys){
        $result .= "$key, ";
      }
      else {
        if($bold) {
          global $det, $language;
          $tmp_key = strtolower(str_replace(' ', '_',trim($key)));
          $key_desc = ($det[$language][$tmp_key] != null) ? $det[$language][$tmp_key] : $key ;
          if ( ($count+3)%4 == 0) {
            $result .= "<div class='row'>";
          } 
          $result .= "<div class='col s6 m3'><p class='feature-item'><b>$key_desc</b><br />" . (is_numeric($value) ? number_format($value, 2) : $value) . "</p></div>";
          if ($count%4 == 0){
            $result .= "</div>";
          }
        }
        else{
          $result .= "$key" . ($value == 1 ? '' : ": $value") . ", ";
        }
      }
      $count++;
    }
    $result = trim($result, ", ");
    return "$result";
  }

  function parse_details($array) {
    if($array == null)
      return false;
    
    $result = '';
    foreach ($array as $key => $value) {
      if (is_array($value)) {
        if (!is_numeric($key) && !empty($value))
          $result .= "|<b>$key</b><br />";
          $result .= parse_details($value);
      }
      else {
        $result .= "$key<br />";
      }
    }
    return $result;
  }

  function fix($s){
    $search = ["Ã","Ã","Ã¡","Ã©","Ã­","Ã³","Â´"];
    $replace = ["Á","É","á","é","í","ó","'"];
    return str_replace($search, $replace, $s);
  }
?>