$(document).ready(function() {

  new WOW().init();

  $('.button_for_modal').on('click', function() {
		var trigger = this.getAttribute("data-trigger");
    $('.modal_heading').text(trigger);
    $('.modal_trigger').val(trigger);
	});

  $('.new_message').on('submit', function() {
		var input_email=$(this).find('.form_email');
		var is_email=input_email.val();
		if (is_email) {
			input_email.removeClass("invalid").addClass("valid");
		}
		else {
			input_email.removeClass("valid").addClass("invalid");
		}

		var input_message=$(this).find('.form_message');
		var is_message=input_message.val();
		if (is_message) {
			input_message.removeClass("invalid").addClass("valid");
		}
		else {
			input_message.removeClass("valid").addClass("invalid");
		}

		if (is_email && is_message) {
			$('.modal').modal('hide');

      $('#thank_you_modal').modal('show');

  		return true;
		}
		else {
			return false;
		}
	});

  $(".fancybox").fancybox({
    padding: 0,
	  helpers : {
      title : null,
      overlay: {
	      locked: false
	    }
    }
	});

  // Center modal
  function centerModals(){
    $('.modal').each(function(i){
      var $clone = $(this).clone().css('display', 'block').appendTo('body');
      var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
      top = top > 0 ? top : 0;
      $clone.remove();
      $(this).find('.modal-content').css("margin-top", top);
    });
  }
  $('.modal').on('show.bs.modal', centerModals);
  $(window).on('resize', centerModals);

  // browser window scroll (in pixels) after which the "back to top" link is shown
	var offset = 300,
	contacts_offset = 0,
	//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
	offset_opacity = 1200,
	//duration of the top scrolling animation (in ms)
	scroll_top_duration = 700,
	//grab the "back to top" link
	$back_to_top = $('.cd-top');
	$to_contacts = $('.cd-top-envelope');

	//hide or show the "back to top" link
	$(window).scroll(function(){
		( $(this).scrollTop() > offset ) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
		( $(this).scrollTop() > contacts_offset ) ? $to_contacts.addClass('cd-is-visible') : $to_contacts.removeClass('cd-is-visible cd-fade-out');
		// if( $(this).scrollTop() > offset_opacity ) {
		// 	$back_to_top.addClass('cd-fade-out');
		// }
	});

	//smooth scroll to top
	$back_to_top.on('click', function(event){
		event.preventDefault();
		$('body,html').animate({
			scrollTop: 0 ,
		 	}, scroll_top_duration
		);
	});

	//smooth scroll to contacts
	$to_contacts.on('click', function(event){
		event.preventDefault();
		$('html, body').animate({
      scrollTop: $("#contacts").offset().top
    	}, scroll_top_duration
		);
	});

});
