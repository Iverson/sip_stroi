var Counter = function(options) {
  this.$el     = options.$el;
  this._plus  = this.$el.find('.b-counter__btn_plus');
  this._minus = this.$el.find('.b-counter__btn_minus');
  this._input = this.$el.find('input');

  this.state = {
    value: 0
  };

  this.initialize();
};

Counter.prototype = {

  initialize: function() {
    this.setValue(this.state.value);

    this._plus.on('click', this.setValue.bind(this, function() { return this.state.value + 1}.bind(this)));
    this._minus.on('click', this.setValue.bind(this, function() { return this.state.value - 1}.bind(this)));
    this._input.on('change', this.validateValue.bind(this));
  },

  validateValue: function() {
    this.setValue(this._input.val());
  },

  setValue: function(val, options) {
    val = (typeof val == 'function') ? val() : val;
    this.state.value = (val < 0) ? 0 : val;

    this._input.val(this.state.value);
    this.$el.trigger('valueChange', this.state.value);
  }

  
};

$.fn.Counter = function(options)
{
  this.each(function()
  {
    options = $.extend(options, {$el: $(this)});

    new Counter(options);
  });
};

$(function() {
  $('.b-counter').Counter();
});