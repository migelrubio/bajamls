<?php
function shorten($str, $len) {
	$new_str = substr($str, 0, $len);
	return substr($new_str, 0, strrpos($new_str, ' ')); 
}

require_once("flexmlsAPI.php");
error_reporting(0);
$api = new flexmlsAPI("cab_westerlund_key_1", "5lCZrVg8d4uYSviaNIN4t");
$api->SetApplicationName("Diamante-MLS-Search/1.0");
$api->SetDeveloperMode(false);
$auth = $api->Authenticate();
if ($auth === false) api_error_thrown($api);

$language = (isset($_GET['lang'])) ? $_GET['lang'] : 'en';
$currency = ($language == 'en') ? 'USD' : 'MXP';

$xml = simplexml_load_file("http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml")->Cube[0]->Cube[0];
$usd = 0;
$mxn = 0;
foreach ($xml->Cube as $item) {
	if((string)$item['currency'] === 'USD')
		$usd = (real)$item['rate'];
		
	if((string)$item['currency'] === 'MXN')
		$mxn = (real)$item['rate'];
}

$rate = $mxn/$usd;

$parameters = null;
$listing = null;
$standard = null;
$custom = null;
$photos = null;
$id = $_GET['id'];
$parameters = array("_expand" => 'CustomFields,Photos');
$listing = $api->GetListing($id,$parameters);

$standard = $listing[0]['StandardFields'];
$custom = $listing[0]['CustomFields'][0];
$photos = $listing[0]['StandardFields']['Photos'];

$main_photo = '';
$thumbnails = array();
foreach ($photos as $item) {
	if ($item['Primary'] == 1) {
		$main_photo = $item['Uri800'];
	}
	else {
		array_push($thumbnails, $item['Uri640']);
	}
}

$stai = $standard['StreetAdditionalInfo'];
$stnu = $standard['StreetNumber'];
$stna = $standard['StreetName'];
$street = ((null != $stai && $stai != '********') ? $stai . ' ' : '') . ((null != $stnu && $stnu != '********') ? $stnu . ' ' : '') . ((null != $stna && $stna != '********') ? $stna : '');

$description = '';
$description_es = '';
error_reporting(0);
$json = file_get_contents('https://www.googleapis.com/language/translate/v2?key=AIzaSyA2XBI0Wlol8wIHwZ28nGvtpk01VBgdDAQ&q=' . urlencode($standard['PublicRemarks']) . '&source=en&target=es');
$json = json_decode($json, true);
$translations = $json['data']['translations'];

foreach($translations as $translation) {
	$description_es .= "{$translation['translatedText']}";
}

if(trim($description_es) == '')
	$description_es = preg_replace('/[^a-zA-Z0-9\s\.,()-]/','', $standard['PublicRemarks']);

$description = preg_replace('/[^a-zA-Z0-9\s\.,()-]/','', $standard['PublicRemarks']);

$mxp_price = number_format($standard['ListPrice'] * $rate, 2) . '  MXP';
$usd_price = number_format($standard['ListPrice'], 2) . '  USD';

$general_desc = null;
$loc_tax_leg = null;
$amenities = null;
$const = null;
$devices = null;
$appliances = null;
$road_type = null;
$connectivity = null;

$title = null;
$electricity = null;
$water = null;
$sewage = null;
$how_to_show = null;

$main = null;
$details = null;

function parse_data($array, $just_keys = false, $bold = true){
	if($array == null)
		return '';
	$result = '';
	foreach(new RecursiveIteratorIterator(new RecursiveArrayIterator($array)) as $key => $value){
		if($just_keys){
			$result .= "$key, ";
		}
		else {
			if($bold) {
				global $det, $language;
				$tmp_key = strtolower(str_replace(' ', '_',trim($key)));
				$key_desc = ($det[$language][$tmp_key] != null) ? $det[$language][$tmp_key] : $key ;
				$result .= "|<b>$key_desc</b><br />" . (is_numeric($value) ? number_format($value, 2) : $value);
			}
			else{
				$result .= "$key" . ($value == 1 ? '' : ": $value") . ", ";
			}
		}
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

if($custom) {
	$main = parse_data($custom['Main']);
	$details = parse_details($custom['Details']);	
	
	$tmp_arr = explode('|', $main);
	$tmp_count = 0;
	$main = '';
	foreach($tmp_arr as $item) {
		if (!empty($item)) {
			if ($tmp_count == 0) {
				$main .= "<tr><td>$item</td>";
			}
			elseif ($tmp_count == 3) {
				$main .= "<td>$item</td></tr>";
			}
			else {
				$main .= "<td>$item</td>";
			}
			if ($tmp_count == 3) {
				$tmp_count = 0;
			} else {
				$tmp_count++;
			}
		}
	}

	$main .= substr($string, -5) == '</tr>' ? '' : '</tr>';
}


?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
<meta http-Equiv="Cache-Control" Content="no-cache">
<meta http-Equiv="Pragma" Content="no-cache">
<meta http-Equiv="Expires" Content="0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
	html {font-family:Helvetica;font-size:10pt;color:#000}
	body {width:100%;margin:30px auto 0px auto;}
	@page {margin:0in;}
	.photo {border:1px solid #999;}
	.details {font-size:7pt;}
	.thumbnail {border:1px solid #999;}
	.justify {text-align:justify}
	.content {margin:0in 0.25in;height:100%;}
	.amenities {font-size:7pt}
	.qrcontainer {height:280px;background:url(css/scan_bg.png) bottom left no-repeat;}
	.disclaimer {text-align:center;font-size:6pt;}
	.disclaimer p {margin:0px auto;}
	.disclaimer p a {color:#06C;}
</style>
</head>
<body>
	<div class="content">
		<table cellpadding="5" cellspacing="0" border="0" width="100%">
			<tr>
				<td rowspan="2" colspan="3" valign="top"><img src="<?php echo $main_photo; ?>" width="800" height="570" class="photo" /></td>
				<td valign="top" align="right"><img src="<?php echo $thumbnails[0]; ?>" width="360" height="270" class="thumbnail" /></td>
			</tr>
			<tr>
				<td valign="top" align="right"><img src="http://maps.googleapis.com/maps/api/staticmap?center=<?php echo $standard['Latitude'] . ',' . $standard['Longitude']; ?>&zoom=16&size=360x270&maptype=roadmap&markers=color:blue|<?php echo $standard['Latitude'] . ',' . $standard['Longitude']; ?>&sensor=false" class="thumbnail" /></td>
			</tr>
		</table>
		<table cellpadding="2" cellspacing="0" border="0" width="100%">
			<tr>
				<td align="left" width="50%" colspan="3">
					<b><i style="color:#06C;font-size:13pt">$ <?php echo $mxp_price; ?></i></b><br />
					<b style="font-size:12pt"><?php echo strtoupper($street); ?></b>
				</td>
				<td align="right" width="50%" colspan="3">
					<b><i style="color:#06C;font-size:13pt">$ <?php echo $usd_price; ?></i></b><br />
					<b style="font-size:12pt">MLS: <?php echo $standard['ListingId']; ?></b>
				</td>
			</tr>
			<tr>
				<td valign="top" class="justify" colspan="3" height="4.5cm"><p style="padding:0px 5px;"><b>Description:</b><br /><?php echo shorten($description, 400) . ' ...'; ?></p></td>
				<td valign="top" class="justify" colspan="3" height="4.5cm"><p style="padding:0px 5px;"><b>Descripción:</b><br /><?php echo shorten(htmlspecialchars($description_es), 400) . ' ...'; ?></p></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<img src="<?php echo $thumbnails[1] ?>" width="360" height="240" class="thumbnail" />
				</td>
                <td colspan="2" align="center">
					<img src="<?php echo $thumbnails[2] ?>" width="360" height="240" class="thumbnail" />
				</td>
                <td colspan="2" align="center">
					<img src="<?php echo $thumbnails[3] ?>" width="360" height="240" class="thumbnail" />
				</td>
			</tr>
			<tr>
				<td colspan="4" align="left" valign="top"><br />
					<table cellpadding="0" cellspacing="0" border="0" width="100%" class="amenities">
						<?php echo $main; ?>
					</table>
				</td>
				<td colspan="2" align="right" valign="top" class="qrcontainer"><img src="https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl=<?php echo urlencode('http://www.diamanteassociates.com/mls-search.aspx?mls_number=' . $standard['ListingId']); ?>&choe=UTF-8" /></td>
			</tr>
			<tr>
				<td colspan="6" class="disclaimer">
					<p>Los precios en pesos son calculados en base al tipo de cambio al momento de la consulta, el precio en pesos puede variar.</p>
					<p>La informaci&oacute;n en espa&ntilde;ol es una traducci&oacute;n automatizada del texto en ingl&eacute;s, por lo tanto puede ser imprecisa.</p>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>