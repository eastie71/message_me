// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
// Loads all Semantic javascripts
//= require semantic-ui
//= require_tree .

scroll_top = function() {
	if ($('#messages').length > 0) {
		$('#messages').scrollTop(0);
	}
}

message_listeners = function() {
	var message_field = document.getElementById('message_content');

	$('message_content').on('keydown', function(e) {
		// Check if user hits enter key
		if (e.keyCode == 13) {
			$('button').click();
		}
	});

	// After hitting enter key - clear the field
	message_field.addEventListener('keyup', 
		(e) => {
			e.preventDefault();
			if (e.keyCode === 13) {
				e.target.value = '';
			}
		}
	);
}

$(document).on('turbolinks:load', function() {
	$('.ui.dropdown').dropdown();

	// Close the flash messages
	$('.message .close').on('click', function() {
    	$(this).closest('.message').transition('fade');
	});

	message_listeners();

	scroll_top();
});

