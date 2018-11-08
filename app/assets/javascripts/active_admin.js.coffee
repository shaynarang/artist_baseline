#= require active_admin/base
#= require activeadmin_reorderable

$ ->
  posts_message = 'This section will display posts. You can create them by clicking on the Posts tab at the top of the screen.'
  posts_message_html = '<p class="inline-hints posts-hint">' + posts_message + '</p>'

  contact_form_message = 'This section will display the contact form.'
  contact_form_html = '<p class="inline-hints contact-form-hint">' + contact_form_message + '</p>'

  toggleInputs = ->
    content_input = $(this).parent().next()
    photo_input = $(this).parent().next().next()
    posts_li = $(this).parent()

    if this.value == 'Photo'
      content_input.fadeOut()
      posts_li.find('p.posts-hint').remove()
      posts_li.find('p.contact-form-hint').remove()
      photo_input.fadeIn()
    else if this.value == 'Posts'
      photo_input.fadeOut()
      content_input.fadeOut()
      posts_li.find('p.contact-form-hint').remove()
      if posts_li.find('p.posts-hint').length == 0
        posts_li.append(posts_message_html)
    else if this.value == 'Contact Form'
      photo_input.fadeOut()
      content_input.fadeOut()
      posts_li.find('p.posts-hint').remove()
      if posts_li.find('p.contact-form-hint').length == 0
        posts_li.append(contact_form_html)
    else
      photo_input.fadeOut()
      posts_li.find('p.posts-hint').remove()
      posts_li.find('p.contact-form-hint').remove()
      content_input.fadeIn()
    return

  prepareInputs = ->
    $('div.sections fieldset').each ->
      kind = $(this).find('select.section_kind_select').val()
      if kind == 'Photo'
        content_li = $(this).find('textarea.content_text_area').parent()
        content_li.hide()
      else if kind == 'Posts'
        content_li = $(this).find('textarea.content_text_area').parent()
        posts_li = content_li.prev()
        content_li.hide()
        if posts_li.find('p.posts-hint').length == 0
          posts_li.append(posts_message_html)
      else if kind == 'Contact Form'
        content_li = $(this).find('textarea.content_text_area').parent()
        contact_form_li = content_li.prev()
        content_li.hide()
        if contact_form_li.find('p.contact-form-hint').length == 0
          contact_form_li.append(contact_form_html)

  $(document).on 'change', 'select.section_kind_select', toggleInputs

  $(document).on 'click', 'a.has_many_add', prepareInputs

  prepareInputs()
