var PanelsTableRow = function(options) {
  this.$el      = options.$el;
  this._counter = this.$el.find('.b-counter');
  this._total   = this.$el.find('.total');


  this.props = this.$el.data('json');

  this.initialize();
};

PanelsTableRow.prototype = {

  initialize: function() {
    this._counter.on('valueChange', this.counterChange.bind(this));
  },

  counterChange: function(evt, value) {
    this.props.count = value;
    this._total.text(this.getTotalPrice());
    
    $(document).trigger('changeOrder', this.props);
  },

  getTotalPrice: function() {
    if (this.props.count <= 0) {
      return '';
    }

    return (this.props.count * this.props.price).toLocaleString();
  },

  setValue: function(val) {
  }

  
};

$.fn.PanelsTableRow = function(options)
{
  this.each(function()
  {
    options = $.extend(options, {$el: $(this)});

    new PanelsTableRow(options);
  });
};

$(function() {
  $('.b-table_panels__row').PanelsTableRow();
});