ActiveAdmin.register Page do
  config.sort_order = 'position_asc'

  reorderable

  config.filters = false

  permit_params :title, :position, :sections_attributes => [:id, :kind, :content, :position, :_destroy, :photos_attributes => [:id, :imageable_id, :imageable_type, :image, :remote_image_url, :_destroy]]

  index as: :reorderable_table do
    column :title
    actions
  end

  show do
    attributes_table do
      row :title
      if page.sections.any?
        panel 'Sections' do
          reorderable_table_for page.sections.order(:position) do
            column :kind
            column :content
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

      s.has_many :photos, new_record: false do |p|
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
end
