function showCalculator(price){
	if($('#calculator_frame').attr('src') == ''){
		$('#calculator_frame').attr('src', 'calculator.php?lang=' + language + '&sale_price=' + price);
	}
	
	$('#details > div').fadeOut(0);
	$('#calculator_container').fadeIn(250);
};

function sendConsultation(){
	var valid = true;
	var data = {};
	var regEx = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	
	$('#consultation_container .half input:text').each(function(i){
		if($(this).val() == ''){
			$(this).attr('class','error');
			valid = false;
		}
		else
			$(this).attr('class','textbox');

		data[$(this).attr('id')] = $(this).val();
	});
	
	$('#consultation_container .half select').each(function(i){
		data[$(this).attr('id')] = $(this).val();
	});
	
	if($('#consultation_email').val() == ''){
		valid = false;
		$('#consultation_email').attr('class', 'error');
	}
	else {
		if (regEx.test(jQuery.trim($('#consultation_email').val()))) 
			$('#consultation_email').attr('class', 'textbox');
		else {
			$('#consultation_email').attr('class', 'error');
			valid = false;
		}
	}
	
	if($('#consultation_comments').val() == ''){
		valid = false;
		$('#consultation_comments').attr('class', 'error');
	}
	else {
		$('#consultation_comments').attr('class', 'textbox');
	}
	
	data['consultation_comments'] = $('#consultation_comments').val();
	
	data['portal'] = portal;

	if(valid){
		$.post('sendConsultation.php', data,
			function(msg){
				if(msg == 'OK'){
					$('#name').val('');
					$('#email').val('');
					$('#phone').val('');
					$('#user_message').val('');
					var msg = (language == 'es') ? 'Su consulta ha sido enviada, pronto nos pondremos en contacto.' : 'Your consultation has been successfully sent, we will contact you soon.';
					$('#consultation_message').attr('class','success_msg').html(msg).fadeIn(500).delay(5000).fadeOut(1500);
					$('#consultation_container .half input:text').each(function(i){
						$(this).val('');
					});
					$('#consultation_comments').val('');
				}
				else{
					var msg = (language == 'es') ? 'Su consulta no pudo ser enviada.' : 'Your consultation couldn\'t be sent.';
					$('#consultation_message').attr('class','error_msg').html(msg).fadeIn(500).delay(5000).fadeOut(1500);
				}
		});
	}

}

function sendInquiry(){
	var valid = true;
	var regEx = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	
	if($('#name').val() == ''){
		valid = false;
		$('#name').attr('class', 'error');
	}
	else {
		$('#name').attr('class', 'textbox');
	}
	
	if($('#email').val() == ''){
		valid = false;
		$('#email').attr('class', 'error');
	}
	else {
		if (regEx.test(jQuery.trim($('#email').val()))) 
			$('#email').attr('class', 'textbox');
		else {
			$('#email').attr('class', 'error');
			valid = false;
		}
	}
	
	if($('#phone').val() == ''){
		valid = false;
		$('#phone').attr('class', 'error');
	}
	else {
		$('#phone').attr('class', 'textbox');
	}
	
	if($('#user_message').val() == ''){
		valid = false;
		$('#user_message').attr('class', 'error');
	}
	else {
		$('#user_message').attr('class', 'textbox');
	}
	
	if(valid){
		$.post('sendInquiry.php', {
			portal:portal,
			mls_number:$('#email_container #mls_number').val(),
			name:$('#name').val(),
			phone:$('#phone').val(),
			email:$('#email').val(),
			user_message:$('#user_message').val(),
			agent_name:$('#agent_name').val(),
			agent_email:$('#agent_email').val()},
			function(msg){
				if(msg == 'OK'){
					$('#name').val('');
					$('#email').val('');
					$('#phone').val('');
					$('#user_message').val('');
					var msg = (language == 'es') ? 'Sus comentarios han sido enviados, pronto nos pondremos en contacto.' : 'Your comments have been successfully sent, we will contact you soon.';
					$('#message').attr('class','success_msg').html(msg).fadeIn(500).delay(5000).fadeOut(1500);
				}
				else{
					var msg = (language == 'es') ? 'Sus comentarios no pudieron ser enviados.' : 'Your comments couldn\'t be sent.';
					$('#message').attr('class','error_msg').html(msg).fadeIn(500).delay(5000).fadeOut(1500);
				}
		});
	}
}

function loadDetail(id, stamp){
	$('.row').attr('class', 'row');
	$('.row[rel=' + id +']').attr('class', 'row active');
	var number = $('.row[rel=' + id +']').find('#listing_number').html();
	var name = $('.row[rel=' + id +']').find('#listing_name').html();
    var price = $('.row[rel=' + id +']').find('#listing_price').html();
    /*
    window.parent.Tawk_API.addEvent(
        'Visitor-viewed-listing', {
            'MLS' : number, 
            'Name' : name,
            'Price' : price
        }, function(error){});
        
        window.parent.Tawk_API.maximize();
    */

	if(number != null && name != null){
		$('#listing_detail').html('&nbsp;&nbsp;<b>' + number + '</b> / <span>' + name + '</span>');
	}
	else{
		$('#listing_detail').html('&nbsp;&nbsp;<em>' + (language == 'es') ? 'La propiedad esta siendo actualizada, se cargará la siguiente propiedad.' : 'Listing is being updated, next listing will be loaded.' + '</em>');
	}

	$("#details").html("<img src=\"css/loading.gif\" class=\"loading\" />");
	$.ajax({
		url: 'details.php' + '?id=' + id + '&lang=' + language + '&stamp=' + stamp,
		context: document.body,
		global: false,
		success: function(data){
			selectedListing = id.toString();
			if(data != 'ERROR'){
				$('#details').html(data);
				$('#message').html('').fadeOut(0);
				$('#details_trigger').click();
			}
			else{
				var nextListing = $('a.row[rel=' + id.toString() + ']').next('a');//.html();
				var parent = $('a.row[rel=' + id.toString() + ']').parent().attr('id');

				if(nextListing == null){
					loadDetail($("#listings a:first").attr('rel'));
				}
				else{
					loadDetail(nextListing.attr('rel'));
				}
			}
		}
	});
}

function switchPhoto(url){
	$('#photo').fadeOut(150);
	$('#photo').attr('src', url);
	$('#photo').load(function(){
		$('#photo').fadeIn(1000);
		
	});
}

$(function(){
	var url = '';
	var page = 1;
	var pages = 0;
	var loading = false;
	var max = 25;
	var loaded = 0;
	var autoload = false;
	
	function numberFormat(num, dec){
		num += '';
		x = num.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		var result = (dec == true) ? x1 + x2 : x1;
		
		return result;
	}
	
	function showPaging(){
		$(".nav_pages").html('Page ' + page + '/' + pages);
		if(page < pages)
			$(".nav_next").html('<img src="css/next.png" />');
		else
			$(".nav_next").html('');

		if(page > 1)
			$(".nav_prev").html('<img src="css/prev.png" />');
		else
			$(".nav_prev").html('');
	}
	
	function getListings(){
		loading = true;
		$('#listings').html("<img src=\"css/loading.gif\" class=\"loading\" />");
		
		$.ajax({
			url: url + '&page=' + page,
			dataType: 'json',
			context: document.body,
			global: false,
			success: function(json){
				var html = '';
				var last = (json.length > 1) ? json.length - 1 : 0;
				var load = '';

				$('#listings').html('');

				pages = json[last].TotalPages;
				page = json[last].CurrentPage;
				
				var submit = (language == 'en') ? 'Submit' : 'Enviar';
				
				if(page == pages)
					$("#submit").removeAttr("disabled").val(submit);

				$(".total_results").html(numberFormat(json[last].LastCount, false));
				
				if(json[last].LastCount > max) {
					autoload = false;
					$("#submit").removeAttr("disabled").val(submit);
				}
				else {
					autoload = true;
				}

				for(j = 0; j < last; j++) {
					var stai = json[j].StandardFields.StreetAdditionalInfo;
					var stnu = json[j].StandardFields.StreetNumber;
					var stna = json[j].StandardFields.StreetName;
					var street = (((null != stai && stai != '********') ? stai + ' ' : '') + ((null != stnu && stnu != '********') ? stnu + ' ' : '') + ((null != stna && stna != '********') ? stna : '')).toUpperCase();
                    var chgType = json[j].StandardFields.MajorChangeType;
					var chgTstmp = Date.parse(json[j].StandardFields.MajorChangeTimestamp);
					var now = new Date();
					var daysDif = Math.floor((now - chgTstmp) / (1000 * 60 * 60 * 24));
					var stamp = '';

					if (daysDif <= 3) {
						switch(chgType) {
							case 'Back on Market':
								chgType = '<span class="listing_status back_on_market">Back on Market!</span>';
								stamp = 'bom';
								break;
							case 'Price Reduced':
								chgType = '<span class="listing_status price_reduced">Price Reduced!</span>';
								stamp = 'pr';
								break;
							case 'New Listing':
								chgType = '<span class="listing_status new_listing">New Listing!</span>';
								stamp = 'nl';
								break;
							default :
								chgType = '';
								break;
						}
					}
					else {
						chgType = '';
					}
					
					var price = 0;
					if(language == 'es'){
						price = numberFormat(parseFloat(json[j].StandardFields.ListPrice * exchange_rate).toFixed(2), true) + ' MXP';
					}
					else{
						price = numberFormat(parseFloat(json[j].StandardFields.ListPrice).toFixed(2), true) + ' USD';
					}
					
					loaded++;
					var thumb = (json[j].StandardFields.Photos.length > 0) ? json[j].StandardFields.Photos[0].UriThumb : 'http://www.placehold.it/95x62?text=NO+PHOTO';
					$('<a class="row" rel="' + json[j].Id + '" onclick="loadDetail(this.rel, \'' + stamp + '\');"><div class="thumb"><img src="' + thumb + '" /></div><p>' + chgType + '<b id="listing_price">$ ' + price + '</b><br /><span id="listing_name">' + street + '</span><br />' + json[j].StandardFields.City + '<br />MLS # <i id="listing_number">' + json[j].StandardFields.ListingId + '</i></p></a>').appendTo('#listings');
				}

				if(page == 1) {
					if($("#listings").children().length > 0 && selectedListing == '') {
						loadDetail($("#listings a:first").attr('rel'), '\'' + stamp + '\'');
					}
				}
				
				if(selectedListing != '') {
					$('.row[rel=' + selectedListing +']').attr('class', 'row active');
				}
				
				loading = false;
				showPaging();
			},
            error: function(data) {
                var error = data;
            }
		});
	}

	$('.nav_prev').click(function(){
		if(page > 1 && loading == false){
			page--;
			getListings();
		}
	});
	
	$('.nav_next').click(function(){
		if(page < pages && loading == false){
			page++;
			getListings();
		}
	});
	
	$('#submit').click(function(){
		var num = $('#mls_number').val();
		var loc = $('#city').val();
		var typ = $('#property_type').val();
		var pri = $('#list_price').val();
		var dev = $('#development').val();
		var bed = $('#bedrooms').val();
		var bat = 0;
        var lCity = loc;
        var lType = '';
        var lPrice = '';
        
        switch(typ){
            case 'A':
                lType = 'Condos';
                break;
            case 'B':
                lType = 'Houses';
                break;
            case 'C':
                lType = 'Townhouses';
                break;
            case 'E':
                lType = 'Land';
                break;
            case 'F':
                lType = 'Commercial';
                break;
            case 'G':
                lType = 'Business';
                break;
            case 'I':
                lType = 'Multifamily';
                break;
            default:
                lType = 'Any type';
                break;
        }
        
        switch(pri) {
            case 'Ge 200000.0 And ListPrice Le 500000.0':
                lPrice = ' from 200,000 to 500,000 USD';
                break;
            case 'Ge 500000.0 And ListPrice Le 1000000.0':
                lPrice = ' from 500,000 to 1,000,000 USD';
                break;
            case 'Ge 1000000.0':
                lPrice = ' over 1,000,000 USD';
                break;
            default:
                lPrice = 'Any price';
                break;
        }
		
		selectedListing = '';
		
		loaded = 0;
		autoload = false;
		
		switch(loc){
			case 'La Paz':
				loc = "City Eq 'La Paz'";
				break;
			case 'La Ventana':
				loc = "SubdivisionName Eq 'La Ventana' Or SubdivisionName Eq 'El Sargento'";
				break;
			case 'Cabo San Lucas':
				loc = "City Eq 'Cabo San Lucas'";
				break;
			case 'Cabo Corridor':
				loc = "City Eq 'Cabo Corridor'";
				break;
			case 'San Jose del Cabo':
				loc = "City Eq 'San Jose del Cabo'";
				break;
			case 'San Jose Corridor':
				loc = "City Eq 'San Jose Corridor'";
				break;
			case 'East Cape':
				loc = "City Eq 'East Cape' Or City Eq 'Los Barriles'";
				break;
			case 'Pacific Side':
				loc = "City Eq 'Pacific' Or City Eq 'Pacific Side' Or City Eq 'Todos Santos'";
				break;
			default:
			loc = '';
		}
		/*
        if (num != '') {
            window.parent.Tawk_API.addEvent('Visitor-made-a-search', {'Looking-for'  : 'MLS#' + num}, function(error){});
        }
        else {
            window.parent.Tawk_API.addEvent(
                'Visitor-made-a-search', {
                    'Property-type'  : lType,
                    'In' : lCity || 'Any location',
                    'Price-range' : lPrice
                }, function(error){});
        }
        */
		var fea = (num == '' && loc == '' && typ == '' & pri == '') ? '1' : '0';
		url = "search.php?mls_number=" + num + "&city=" + loc + "&property_type=" + typ + "&list_price=" + pri + "&development=" + dev + "&bedrooms=" + bed + "&bathrooms=" + bat;
		page = 1;
		pages = 0;
		$('#listings').html("<img src=\"css/loading.gif\" class=\"loading\" />");
		$('.nav_prev').html('');
		$('.nav_pages').html('');
		$('.nav_next').html('');
		$('#others').html('');
		$('#details').html('');
		$('#listing_detail').html('');
		$('.total_results').html('0');
		if(language == 'en')
			$('#submit').attr("disabled", "true").val('Loading');
		else
			$('#submit').attr("disabled", "true").val('Cargando');

		getListings(url);
	});
	
	$('.toolbar li a').click(function(e){
		$('.toolbar li a').removeAttr('class');
		$(this).attr('class', 'current');
		var target = $(this).attr('rel');
		
		if(target == '#email_container')
			$(this).attr('class', 'current_email');
		
		if(target != 'portal'){
			$('#details > div').fadeOut(0);
			$(target).fadeIn(250, function(){
				if(target == '#map_container')
					loadMap();
			});
		}
	});
	
});