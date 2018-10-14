class Page < ActiveRecord::Base
  acts_as_list

  has_many :sections, :dependent => :destroy

  accepts_nested_attributes_for :sections, allow_destroy: true

  scope :published, -> { where(published: true) }
end