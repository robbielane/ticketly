class Category < ActiveRecord::Base
  has_many :tickets
  fuzzily_searchable :name
end
