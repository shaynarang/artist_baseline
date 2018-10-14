#= require active_admin/base
#= require activeadmin_reorderable

posts_message = 'This section will display posts. You can create them by clicking on the Posts tab at the top of the screen.'
posts_message_html = '<p class="inline-hints">' + posts_message + '</p>'

$ ->
  toggleInputs = ->
    content_input = $(this).parent().next()
    photo_input = $(this).parent().next().next()
    posts_li = $(this).parent()

    if this.value == 'Photo'
      content_input.fadeOut()
      posts_li.find('p.inline-hints').remove()
      photo_input.fadeIn()
    else if this.value == 'Posts'
      photo_input.fadeOut()
      content_input.fadeOut()
      if posts_li.find('p.inline-hints').length == 0
        posts_li.append(posts_message_html)
    else
      photo_input.fadeOut()
      posts_li.find('p.inline-hints').remove()
      content_input.fadeIn()
    return

  prepareInputs = ->
    $('div.sections fieldset').each ->
      kind = $(this).find('select.section_kind_select').val()
      content_li = $(this).find('textarea.content_text_area').parent()
      if kind == 'Photo'
        content_li.hide()
      else if kind == 'Posts'
        $(this).find('li.photos').hide()
        content_li.hide()
        if content_li.prev().find('p.inline-hints').length == 0
          content_li.prev().append(posts_message_html)


  $(document).on 'change', 'select.section_kind_select', toggleInputs

  $(document).on 'click', 'a.has_many_add', prepareInputs

  prepareInputs()
