module ActiveAdmin::ApplicationHelper
  def variable_image_tag(photo, version, klass=nil)
    url = photo&.image&.url
    extension = File.extname(url)
    if extension == '.svg' && klass == 'logo-image'
      inline_svg url, class: klass, height: '10em', width: '10em'
    elsif extension == '.svg'
      inline_svg url, class: klass
    else
      image_tag url(version), class: klass
    end
  end
end
