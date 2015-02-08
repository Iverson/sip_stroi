var ProjectComplectation = function(options) {
  this.$el     = options.$el;
  this._labels = this.$el.find('.b-checkbox');
  this._inputs = this.$el.find('input[data-type="isInstanceDefault"]');
  this._sum    = $('[rel="project-sum"]');
  this._tr     = this.$el.find('.row');

  this.state = {
    sum: 0
  };

  this.initialize();
};

ProjectComplectation.prototype = {

  initialize: function() {
    this._labels.on('click', this.toggle.bind(this));
    this._tr.on('click', this.clickTr.bind(this));

    this._inputs
      .on('click', this.clickCheckbox.bind(this))
      .on('change', this.calcTotalPrice.bind(this));
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

  calcTotalPrice: function() {
    var sum = 0;

    this._inputs.filter(':checked').each(function() {
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