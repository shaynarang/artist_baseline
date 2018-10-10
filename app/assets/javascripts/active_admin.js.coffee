#= require active_admin/base
#= require activeadmin_reorderable

$ ->
  toggleInputs = ->
    content_input = $(this).parent().next()
    photo_input = $(this).parent().next().next()
    if this.value == 'Photo'
      content_input.fadeOut()
      photo_input.fadeIn()
    else
      content_input.fadeIn()
      photo_input.fadeOut()
    return

  prepareInputs = ->
    $('div.sections fieldset').each ->
      kind = $(this).find('select.section_kind_select').val()
      if kind == 'Photo'
        $(this).find('textarea.content_text_area').parent().hide()
      else
        $(this).find('li.photos').hide()

  $(document).on 'change', 'select.section_kind_select', toggleInputs

  $(document).on 'click', 'a.has_many_add', prepareInputs

  prepareInputs()
