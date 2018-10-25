ActiveAdmin.register Site do
  menu label: 'Site Details'
  config.clear_action_items!
  config.filters = false
  actions :index, :show, :edit, :update

  permit_params :title, :photos_attributes => [:id, :imageable_id, :imageable_type, :image, :remote_image_url, :_destroy], :themes_attributes => [:id, :name, :font_url, :nav_background_color, :nav_text_color, :main_background_color, :content_background_color, :content_text_color, :border_color, :published, :_destroy]

  index do
    column :title
    column :logo do
      if sites[0].photos.any?
        image_tag(sites[0].photos[0]&.image&.url(:thumb))
      end
    end
    column :themes do
      themes = sites[0].themes
      themes.pluck(:name).join(', ')
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
      p.input :remote_image_url, :label => 'Paste Image URL', :hint => (image_tag(p.object.image.url(:thumb)) if p.object && p.object.image && !p.object.image.url.blank?)
      p.input :_destroy, as: :boolean, required: :false, label: 'Remove image'
    end

    f.has_many :themes do |t|
      t.input :name
      t.input :font_url
      t.input :nav_background_color
      t.input :nav_text_color
      t.input :main_background_color
      t.input :content_background_color
      t.input :content_text_color
      t.input :border_color
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
          image_tag(site.photos[0]&.image&.url(:thumb))
        end
      end
      row :themes do
        if site.themes.any?
          site.themes.pluck(:name).join(', ')
        end
      end
    end
  end
end
