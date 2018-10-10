class Section < ActiveRecord::Base
  belongs_to :page
  has_many :photos, :as => :imageable, :dependent => :destroy

  acts_as_list scope: :page

  accepts_nested_attributes_for :photos, :allow_destroy => true

  KINDS = %w(Snippet Text Photo)
end