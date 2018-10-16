class Site < ActiveRecord::Base
  has_many :photos, :as => :imageable, :dependent => :destroy

  accepts_nested_attributes_for :photos, :allow_destroy => true

  validates_presence_of :title
end