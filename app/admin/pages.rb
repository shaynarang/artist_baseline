ActiveAdmin.register Page do
  config.sort_order = 'position_asc'

  reorderable

  config.filters = false

  permit_params :title, :position, :sections_attributes => [:id, :kind, :content, :position, :_destroy, :photos_attributes => [:id, :imageable_id, :imageable_type, :image, :remote_image_url, :_destroy]]

  index as: :reorderable_table do
    column :title
    actions do |page|
      if page.published
        link_to 'Unpublish', unpublish_page_path(page), :class => 'member_link'
      else
        link_to 'Publish', publish_page_path(page), :class => 'member_link'
      end
    end
  end

  show do
    attributes_table do
      row :title
      if page.sections.any?
        panel 'Sections' do
          sections = page.sections.order(:position)
          reorderable_table_for sections do |section|
            column :kind
            column :content do |section|
              if section.kind == 'Snippet'
                section.content.html_safe
              elsif section.kind == 'Photo' && section.photos.any?
                image_tag(section.photos[0]&.image&.url(:thumb))
              elsif section.kind == 'Posts'
                'This section will display the posts you create from the Posts section'
              else
                section.content
              end
            end
          end
        end
      end
    end
  end

  form do |f|
    f.inputs "Page Details" do
      li f.semantic_errors *f.object.errors.keys
      f.input :title
    end
    f.has_many :sections, :multipart => true, sortable: :position, sortable_start: 1 do |s|
      s.input :kind, :as => :select, :collection => Section::KINDS, :include_blank => false, :input_html => { class: 'section_kind_select'}
      s.input :content, :input_html => { class: 'content_text_area'}

      s.has_many :photos do |p|
        p.input :image, :label => 'Upload Image'
        p.input :remote_image_url, :label => 'Paste Image URL', :hint => (image_tag(p.object.image.url(:thumb)) if p.object.image && !p.object.image.url.blank?)
        p.input :_destroy, as: :boolean, required: :false, label: 'Remove image'
      end

      s.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
    end
    f.actions do
      f.cancel_link(:back)
      f.action(:submit)
    end
  end

  controller do
    def publish
      page = Page.find(params[:id])
      notice = "#{page.title} published!"
      begin
        page.toggle!(:published)
      rescue ActiveRecord::RecordInvalid => error
        return redirect_back(:fallback_location => admin_pages_path, :alert => error)
      end
      redirect_back(:fallback_location => admin_pages_path, :notice => notice)
    end

    def unpublish
      page = Page.find(params[:id])
      notice = "#{page.title} unpublished!"
      begin
        page.toggle!(:published)
      rescue ActiveRecord::RecordInvalid => error
        return redirect_back(:fallback_location => admin_pages_path, :alert => error)
      end
      redirect_back(:fallback_location => admin_pages_path, :notice => notice)
    end
  end
end
