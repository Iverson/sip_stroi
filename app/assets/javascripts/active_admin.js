//= require active_admin/base
//= require ckeditor/init
//= require activeadmin-sortable

$(function() {
  CKEDITOR.replaceAll('ckeditor_input');
});

// # jQuery.fn.swapWith = (to) ->
// #   copy_to = to.clone(true)
// #   copy_from = @.clone(true)

// #   if (!copy_to.length || !copy_from.length)
// #     return

// #   to.replaceWith(copy_from)
// #   @.replaceWith(copy_to)

// #   addHandlers(copy_to)
// #   addHandlers(copy_from)

// #   copy_to.add(copy_from).find('textarea').each ->
// #     val = $(@).val()
// #     $(@).val('').val(val)

// #   sort_from_index = copy_from.find('.sortable')
// #   sort_to_index   = copy_to.find('.sortable')
// #   tmpVal = sort_from_index.val()
// #   sort_from_index.val(sort_to_index.val())
// #   sort_to_index.val(tmpVal)

// # addHandlers = (el) ->
// #   el
// #   .find '.js-moveUp'
// #   .click ->
// #     prev = el.prevAll '.has_many_fields:first'
// #     el.swapWith(prev)
// #     return false

// #   el
// #   .find '.js-moveDown'
// #   .click ->
// #     prev = el.nextAll '.has_many_fields:first'
// #     el.swapWith(prev)
// #     return false

// # $(->
// #   $('.js-sortableResource').each ->
// #     items = $(@).find('.has_many_fields')

// #     items.each ->
// #       el = $(@)
// #       el.prepend """
// #         <button class="js-moveUp">Up</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="js-moveDown">Down</button>
// #       """
// #         .ready ->
// #           addHandlers(el)
// # )
