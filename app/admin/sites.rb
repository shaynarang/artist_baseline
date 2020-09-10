ActiveAdmin.register Site do
  menu label: 'Theme'
  config.filters = false
  actions :index, :show, :edit, :update

  permit_params :title, :photos_attributes => [:id, :imageable_id, :imageable_type, :image, :remote_image_url, :_destroy], :themes_attributes => [:id, :name, :title_font_url, :title_font_family, :title_font_color, :font_url, :font_family, :nav_background_color, :nav_hover_background_color, :nav_text_color, :main_background_color, :content_background_color, :content_text_color, :border_color, :published, :_destroy]

  index do
    column :title
    column :logo do
      if sites[0].photos.any?
        photo = sites[0].photos[0]
        variable_image_tag(photo, :thumb, 'logo-image')
      end
    end
    column :theme do
      themes = sites[0].themes.published
      themes[0].name if themes.any?
    end
    actions
  end

  form do |f|
    f.inputs "Page Details" do
      li f.semantic_errors *f.object.errors.keys
      f.input :title
    end

    f.has_many :photos, heading: 'Logo' do |p|
      p.input :image, :label => 'Upload Image'
      p.input :remote_image_url, :label => 'Paste Image URL', :hint => (variable_image_tag(p.object, :thumb) if p&.object&.image&.url)
      p.input :_destroy, as: :boolean, required: :false, label: 'Remove image'
    end

    f.has_many :themes do |t|
      t.input :name
      t.input :title_font_url
      t.input :title_font_family
      t.input :title_font_color, as: :string
      t.input :font_url
      t.input :font_family
      t.input :nav_background_color, as: :string
      t.input :nav_hover_background_color, as: :string
      t.input :nav_text_color, as: :string
      t.input :main_background_color, as: :string
      t.input :content_background_color, as: :string
      t.input :content_text_color, as: :string
      t.input :border_color, as: :string
      t.input :published, as: :boolean, required: :false, label: 'Publish'
      t.input :_destroy, as: :boolean, required: :false, label: 'Remove'
    end

    f.actions do
      f.cancel_link(:back)
      f.action(:submit)
    end
  end

  show do
    attributes_table do
      row :title
      row :logo do
        if site.photos.any?
          variable_image_tag(site.photos[0], :thumb, 'logo-image')
        end
      end
      row :theme do
        themes = site.themes.published
        themes[0].name if themes.any?
      end
    end
  end
end
