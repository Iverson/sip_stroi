var ProjectOrder = function(options) {
  this.$el     = options.$el;
  this._labels = this.$el.find('.b-checkbox');
  this._inputs = this.$el.find('input[data-type="isInstanceDefault"]');
  this._sum    = $('[rel="project-sum"]');
  this._tr     = this.$el.find('.row');
  this._button = $('.js-orderButton');

  this.order = {
    sum: 0,
    items: [],
    project: this.$el.data('project')
  };

  this.initialize();
};

ProjectOrder.prototype = {

  initialize: function() {
    this._labels.on('click', this.toggle.bind(this));
    this._tr.on('click', this.clickTr.bind(this));

    this._inputs
      .on('click', this.clickCheckbox.bind(this))
      .on('change', this.calcOrder.bind(this));

    this._button.on('click', this.openOrderForm.bind(this));

    this.calcOrder();
  },

  toggle: function(evt) {
    var target = $(evt.currentTarget);
    evt.stopPropagation();

    target.closest('.row').toggleClass('selected');
  },

  clickCheckbox: function(evt) {
    evt.stopPropagation();
  },

  toggleTr: function(row) {
    row.find('label').click();
  },

  clickTr: function(evt) {
    var target = $(evt.currentTarget);

    this.toggleTr(target);
  },

  calcOrder: function() {
    var self = this;

    this.order.sum   = 0;
    this.order.items = [];

    this._inputs.filter(':checked').each(function() {
      var orderItem = $(this).closest('tr').data('json');

      self.order.items.push(orderItem);
      self.order.sum += parseInt(orderItem.price, 10);
    });

    this._sum.text(this.order.sum.toLocaleString());
  },

  openOrderForm: function() {
    if (this.order.items.length > 0) {
      OrderPopup
        .render({order: this.order}, _.template($('#project_order_popup').html()))
        .then(function(form) {
          form.project = {
            id: this.order.project.id,
            items: this.order.items.map(function(item) { return item.id; })
          };

          this.sendOrder(form);
        }.bind(this));
    }
    
    return false;
  },

  sendOrder: function(data) {
    $.ajax({
      type: "POST",
      url: "/projects_orders",
      data: {projects_order: data},
      success: function(data) {
      }
    });
  }

  
};

$.fn.ProjectOrder = function(options)
{
  this.each(function()
  {
    options = $.extend(options, {$el: $(this)});

    new ProjectOrder(options);
  });
};

$(function() {
  $('.js-projectOrder').ProjectOrder();
});
