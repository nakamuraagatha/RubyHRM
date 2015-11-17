# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	states = $('#contact_detail_state').html()
	console.log(states)
	$('#contact_detail_country').change ->
		country = $('#contact_detail_country :selected').text()
		options = $(states).filter("optgroup[label='#{country}']").html()
		if options
			$('#contact_detail_state').html(options)
