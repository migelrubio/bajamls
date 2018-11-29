<?php
    error_reporting( E_ALL ); //debug
    //echo "config: ".$_SERVER['DOCUMENT_ROOT'];

    //get browser's language
    $language = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
    //overwrite language with url segment
    $def_lang = true;
    $last_segment = "{last_segment}";
    echo $last_segment == "esp";
    if ($last_segment == "esp"){
        $language = "es";
        $def_lang = false;
    }
    /*switch ("{last_segment}") {
        case "esp": $language = "es"; break;
        case "espanol": $language = "es"; break;
        case "eng": $language = "en"; break;
        case "english": $language = "en"; break;
    }*/

    switch ($language){
        case "es":
            include($_SERVER['DOCUMENT_ROOT'] . "/lang/es.php");
            break;
        default:
            include($_SERVER['DOCUMENT_ROOT'] . "/lang/en.php");
            break;
    }
    
    $cities = [
        "la-paz" => [
            "name" => "La Paz",
            "query" => "City Eq 'La Paz'"],
        "la-ventana" => [
            "name" => "La Ventana",
            "query" => "SubdivisionName Eq 'La Ventana' Or SubdivisionName Eq 'El Sargento'"],   
        "todos-santos" => [
            "name" => "Todos Santos",
            "query" => "City Eq 'Pacific' Or City Eq 'Pacific Side' Or City Eq 'Todos Santos'"],
        "pescadero" => [
            "name" => "Pescadero",
            "query" => "City Eq 'Pescadero'"],
        "cabo-san-lucas" => [
            "name" => "Cabo San Lucas",
            "query" => "City Eq 'Cabo San Lucas'"],
        "san-jose-del-cabo" => [
            "name" => "San Jose del Cabo",
            "query" => "City Eq 'San Jose del Cabo'"],
        "los-barriles" => [
            "name" => "Los Barriles",
            "query" => "City Eq 'East Cape' Or City Eq 'Los Barriles'"],
        "loreto" => [
            "name" => "Loreto",
            "query" => "City Eq 'Loreto'"],
    ]

?>
