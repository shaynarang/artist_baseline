ActiveAdmin.register Page do
  permit_params :title, :priority, :texts_attributes => [:id, :content, :priority, :_destroy], :snippets_attributes => [:id, :content, :priority, :_destroy]

  form do |f|
    f.inputs "Page Details" do
      li f.semantic_errors *f.object.errors.keys
      f.input :title
      f.input :priority
    end
    f.has_many :texts do |text|
      text.input :content
      text.input :priority
      text.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
    end
    f.has_many :snippets do |snippet|
      snippet.input :content
      snippet.input :priority
      snippet.input :_destroy, :as => :boolean, :required => false, :label => 'Remove'
    end
    f.actions do
      f.cancel_link(:back)
      f.action(:submit)
    end
  end
end
