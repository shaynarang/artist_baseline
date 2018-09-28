class Page < ActiveRecord::Base
  has_many :texts
  has_many :snippets

  accepts_nested_attributes_for :texts, :snippets, allow_destroy: true
end