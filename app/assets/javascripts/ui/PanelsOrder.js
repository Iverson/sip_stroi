var PanelsOrder = function(options) {
  this.$el       = options.$el;
  this._orderSum = this.$el.find('[rel="order-sum"]');
  this._button   = this.$el.find('.js-orderButton')

  this.order = [];
  this.state = {
    totalSum: 0
  };

  this.initialize();
};

PanelsOrder.prototype = {

  initialize: function() {
    $(document).on('changeOrder', this.changeOrder.bind(this));
    this._button.on('click', this.openOrderForm.bind(this));
  },

  changeOrder: function(evt, item) {
    var index = this.order.indexOf(item);

    if (index > -1) {
      if (item.count > 0) {
        this.order[index] = item;
      } else {
        this.order.splice(index, 1);
      }
    } else {
      if (item.count > 0) {
        this.order.push(item);
      }
    }

    this.state.totalSum = this.getTotalSum();
    this._orderSum.text(this.state.totalSum.toLocaleString());
  },

  getTotalSum: function() {
    return this.order.reduce(function(prev, item) { return prev + item.count*item.price; }, 0);
  },

  openOrderForm: function() {
    if (this.order.length > 0) {
      OrderPopup.render({orderItems: this.order, totalSum: this.state.totalSum});
    }
    
    return false;
  }
  
};

$.fn.PanelsOrder = function(options)
{
  this.each(function()
  {
    options = $.extend(options, {$el: $(this)});

    new PanelsOrder(options);
  });
};

$(function() {
  $('.js-panelsOrder').PanelsOrder();
});