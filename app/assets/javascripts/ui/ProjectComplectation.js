var ProjectComplectation = function(options) {
  this.$el    = options.$el;
  this._items = this.$el.find('input[data-type="isInstanceDefault"]');
  this._sum   = this.$el.find('[rel="sum"]');

  this.state = {
    sum: 0
  };

  this.initialize();
};

ProjectComplectation.prototype = {

  initialize: function() {
    this._items.on('change', this.calcTotalPrice.bind(this));
  },

  toggle: function(evt) {
    
  },

  calcTotalPrice: function() {
    var sum = 0;

    this._items.filter(':checked').each(function() {
      sum += parseInt($(this).data('price'), 10);
    });

    this.state.sum = sum;
    this._sum.text(sum.toLocaleString());
  }

  
};

$.fn.ProjectComplectation = function(options)
{
  this.each(function()
  {
    options = $.extend(options, {$el: $(this)});

    new ProjectComplectation(options);
  });
};

$(function() {
  $('.js-projectComplectation').ProjectComplectation();
});