ActiveAdmin.register Page do
  permit_params :title, :priority, :sections_attributes => [:id, :kind, :content, :priority, :_destroy]

  form do |f|
    f.inputs "Page Details" do
      li f.semantic_errors *f.object.errors.keys
      f.input :title
      f.input :priority
    end
    f.has_many :sections, sortable: :priority, sortable_start: 1 do |section|
      section.input :kind
      section.input :content
      section.input :priority
      section.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
    end
    f.actions do
      f.cancel_link(:back)
      f.action(:submit)
    end
  end
end
