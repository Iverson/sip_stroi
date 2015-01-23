var Carousel = function(options) {
    this.$el = options.$el;
    this._container  = this.$el.find('.b-carousel__overflow');
    this._slider     = this.$el.find('.b-carousel__slider');
    this._prev       = this.$el.find('.b-carousel__arr_left');
    this._next       = this.$el.find('.b-carousel__arr_right');
    this._paginator  = this.$el.find('.b-carousel__paginator');
    this._tabs       = this.$el.find('[rel="tabs"] a');
    this._pages      = null;

    this.state = {
        current_slide: 0,
        margin: 0,
        slides_count: null,
        slide: {
            width: null
        },
        scrollThumbs: this.$el.attr('scroll-thumbs')
    };

    this.initialize();
};

Carousel.prototype = {

    initialize: function() {
        this._prev.on('click', this.showSlide.bind(this, function() { return this.state.current_slide-1}.bind(this)));
        this._next.on('click', this.showSlide.bind(this, function() { return this.state.current_slide+1}.bind(this)));
        this._tabs.on('click', this._tabClick.bind(this));

        this.refresh();
        this._arrowsRefresh();
        this._tabsRefresh();
    },

    refresh: function() {
        var thumb = this._slider.children().eq(0);
        var thumbs_margin = thumb.css('margin-right');

        this.state.margin       = parseInt(thumbs_margin);
        this.state.thumbWidth   = thumb.width();
        this.state.slides_count = Math.ceil(this._slider.width()/(this._container.width()+this.state.margin));

        this.renderPaginator();
    },

    renderPaginator: function() {
        if (!this._paginator.length) {
            return;
        }

        var template = '';
        var self = this;
        this._paginator.empty();

        for (var i = 0; i < this.state.slides_count; i++) {
            template += '<span class="item" data-page="' + i + '"></span>';
        };

        this._paginator.empty().append(template).ready(function() {
            self._pages = self._paginator.find('.item');
            self._pages.eq(0).addClass('active');

            self._pages.on('click', function() {
                self._pages.removeClass('active');
                $(this).addClass('active');

                self.showSlide($(this).data('page'));
            });
        });
    },

    showSlide: function(num) {
        var x;
        num = typeof num == 'function' ? num() : num;

        if ((num == this.state.current_slide) || (num >= this.state.slides_count) || (num < 0)) {
            return;
        }

        if (this.state.scrollThumbs) {
            x = -(num)*this.state.scrollThumbs*(this.state.thumbWidth+this.state.margin);
        } else {
            x = -(num)*(this._container.width()+this.state.margin);
        }

        this.state.current_slide = num;
        this._slider.css({left: x + "px"});
        this._arrowsRefresh();
        this._paginatorRefresh();
        this._tabsRefresh();

        this.$el.trigger('slideChange', num);
    },

    _arrowsRefresh: function() {
        this._prev.toggleClass('disabled', this.state.current_slide == 0);
        this._next.toggleClass('disabled', this.state.current_slide >= this.state.slides_count-1);
    },

    _paginatorRefresh: function() {
        if (!this._pages || !this._pages.length) {
            return;
        }

        this._pages.removeClass('active').eq(this.state.current_slide).addClass('active');
    },

    _tabClick: function(evt) {
        var index = this._tabs.index($(evt.currentTarget));
        this.showSlide(index);

        return false;
    },

    _tabsRefresh: function() {
        if (!this._tabs || !this._tabs.length) {
            return;
        }

        this._tabs.removeClass('active').eq(this.state.current_slide).addClass('active');
    }
};

$.fn.Carousel = function(options)
{
    this.each(function()
    {
        options = $.extend(options, {$el: $(this)});
        
        new Carousel(options);
    });
};

$(function() {
    $('.b-carousel').Carousel();
});