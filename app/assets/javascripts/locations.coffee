jQuery ->
	states = $('#location_province').html()
	console.log(states)
	$('#location_country').change ->
		country = $('#location_country :selected').text()
		options = $(states).filter("optgroup[label='#{country}']").html()
		if options
			$('#location_province').html(options)