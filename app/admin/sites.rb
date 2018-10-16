ActiveAdmin.register Site do
  menu label: 'Site Details'
  config.clear_action_items!
  config.filters = false
  actions :index, :show, :edit, :update

  permit_params :title, :photos_attributes => [:id, :imageable_id, :imageable_type, :image, :remote_image_url, :_destroy]

  index do
    column :title
    column :logo do
      if sites[0].photos.any?
        image_tag(sites[0].photos[0]&.image&.url(:thumb))
      end
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
    end
  end
end
