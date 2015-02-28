(function() {

  var FeedbackPopup = function(options) {
    this._template    = _.template($('#feedback_popup').html());
    this._placeholder = $('.popup-placeholder');

    this.deferred = null;

    this.initialize();
  };

  FeedbackPopup.prototype = {

    initialize: function() {
      var self = this;

      $('.js-feedbackPopup').on('click', function() { self.render(); return false;});
    },

    render: function() {
      var self = this;

      this.deferred = Q.defer();

      this._placeholder.empty().append(this._template()).ready(function() {
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
      var form = this._form.serializeObject().feedback;

      if (form.user_info_attributes.name && form.user_info_attributes.phone && form.message) {
        this.sendFeedback(form);
      } else {
        this.showFormErrors();
      }

      return false;
    },

    sendFeedback: function(data) {
      var self = this;

      $.ajax({
        type: "POST",
        url: "/feedbacks",
        data: {feedback: data},
        success: function(data) {
          self.showSuccessMessage();
        }
      });
    },

    showSuccessMessage: function() {
      this.$el.addClass('success');
    },

    showFormErrors: function() {
      this._formError.show();
    },

    hideFormErrors: function() {
      this._formError.hide();
    }
    
  };

  $(function() {
    new FeedbackPopup();
  });

})();
