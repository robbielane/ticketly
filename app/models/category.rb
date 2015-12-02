class Category < ActiveRecord::Base
  has_many :tickets
  searchkick
end
