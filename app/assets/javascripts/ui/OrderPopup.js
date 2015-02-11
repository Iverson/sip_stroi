(function() {

  var OrderPopup = function(options) {
    this._template    = _.template($('#order_popup_template').html());
    this._placeholder = $('.popup-placeholder');

    this.order = {};

    this.initialize();
  };

  OrderPopup.prototype = {

    initialize: function() {
    },

    render: function(options) {
      var self = this;
      this.order = options;

      this._placeholder.empty().append(this._template(options)).ready(function() {
        self.onRender();
      });
    },

    onRender: function() {
      this.$el        = this._placeholder.find('.b-popup');
      this._overlay   = this._placeholder.find('.b-overlay');
      this._close     = this.$el.find('.b-popup__close');
      this._form      = this.$el.find('.b-form');
      this._formError = this.$el.find('.b-form__error');

      this._close.on('click', this.destroy.bind(this));
      this._overlay.on('click', this.destroy.bind(this));
      this._form.on('submit', this.submit.bind(this))
    },

    destroy: function() {
      this._placeholder.empty();
    },

    submit: function() {
      var form = this._form.serializeObject();

      if (form.user_info_attributes.name && form.user_info_attributes.phone) {
        form.items_attributes = this.order.orderItems;
        this.hideFormErrors();

        $.ajax({
          type: "POST",
          url: "/panels_orders",
          data: {panels_order: form},
          success: function(data) {
            console.log(data);
          }
        });
      } else {
        this.showFormErrors();
      }

      return false;
    },

    showFormErrors: function() {
      this._formError.show();
    },

    hideFormErrors: function() {
      this._formError.hide();
    }
    
  };

  $(function() {
    window.OrderPopup = new OrderPopup();
  });

})();