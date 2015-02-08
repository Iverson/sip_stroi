$(function() {

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

});