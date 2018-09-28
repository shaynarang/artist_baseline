class Page < ActiveRecord::Base
  has_many :texts
  has_many :snippets
end