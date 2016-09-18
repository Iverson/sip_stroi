(function() {

  var OrderPopup = function(options) {
    this._template    = null;
    this._placeholder = $('.popup-placeholder');

    this.order = {};
    this.deferred = null;

    this.initialize();
  };

  OrderPopup.prototype = {

    initialize: function() {
    },

    render: function(options, template) {
      var self = this;

      this.deferred = Q.defer();
      this.order = options;

      this._placeholder.empty().append(template(options)).ready(function() {
        self.onRender();
      });

      return this.deferred.promise;
    },

    onRender: function() {
      this.$el        = this._placeholder.find('.b-popup');
      this._overlay   = this._placeholder.find('.b-overlay');
      this._close     = this.$el.find('.b-popup__close');
      this._form      = this.$el.find('.b-form');
      this._formError = this.$el.find('.b-form__error');

      this._close.on('click', this.close.bind(this));
      this._overlay.on('click', this.close.bind(this));
      this._form.on('submit', this.submit.bind(this));

      this.$el.css({top: $(window).scrollTop() + document.documentElement.clientHeight/2 + 'px'});
    },

    destroy: function() {
      this._placeholder.empty();
    },

    close: function() {
      this.destroy();
      this.deferred.reject();
    },

    submit: function() {
      var form = this._form.serializeObject();

      if (form.user_info_attributes.name && form.user_info_attributes.phone) {
        this.hideFormErrors();
        this.deferred.resolve(form);
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
    },

    showSuccessMessage: function() {
      this.$el.addClass('success');
    }
    
  };

  $(function() {
    window.OrderPopup = new OrderPopup();
  });

})();
