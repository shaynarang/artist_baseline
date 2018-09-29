ActiveAdmin.register Page do
  config.sort_order = 'position_asc'

  reorderable

  permit_params :title, :position, :sections_attributes => [:id, :kind, :content, :position, :_destroy]

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
