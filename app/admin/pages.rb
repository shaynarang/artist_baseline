ActiveAdmin.register Page do
  permit_params :title, :priority, :sections_attributes => [:id, :kind, :content, :priority, :_destroy]

  index do
    column :title
    column :priority
    actions
  end

  show do
    attributes_table do
      row :title
      row :priority
      if page.sections.any?
        table_for page.sections do
          column :kind
          column :content
          column :priority
        end
      end
    end
  end

  form do |f|
    f.inputs "Page Details" do
      li f.semantic_errors *f.object.errors.keys
      f.input :title
    end
    f.has_many :sections, sortable: :position, sortable_start: 1 do |section|
      section.input :kind, :as => :select, :collection => Section::KINDS
      section.input :content
      section.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
    end
    f.actions do
      f.cancel_link(:back)
      f.action(:submit)
    end
  end
end
