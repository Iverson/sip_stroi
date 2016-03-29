$(function() {

  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });

  // Fancybox

  $(".js-fancybox").fancybox({
    prevEffect  : 'none',
    nextEffect  : 'none',
    helpers : {
      title : {
        type: 'over'
      },
      thumbs  : {
        width : 50,
        height  : 50
      }
    }
  });

  $('.b-promo__label').addClass('in');

});