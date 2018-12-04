<?php
$id = $_GET['id'];
$mls = $_GET['mls_number'];
$html = file_get_contents("flyer.php?id=$id");

require_once("dompdf/dompdf_config.inc.php");
$dompdf = new DOMPDF();
$dompdf->load_html($html);
$dompdf->render();
$dompdf->stream("$mls.pdf", array("Attachment" => 0));

?>