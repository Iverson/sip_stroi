var ReviewThumb = function(options) {
  this.$el = options.$el;
  this._toggle = this.$el.find('.b-reviews__thumb__toggle');

  this.state = {
  };

  this.initialize();
};

ReviewThumb.prototype = {

  initialize: function() {
    this._toggle.on('click', this._expdToggle.bind(this));
  },

  _expdToggle: function(evt) {
    this.$el.toggleClass('expd');

    return false;
  }
};

$.fn.ReviewThumb = function(options)
{
  this.each(function()
  {
    options = $.extend(options, {$el: $(this)});

    new ReviewThumb(options);
  });
};

$(function() {
  $('.b-reviews__thumb').ReviewThumb();
});
