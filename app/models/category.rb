class Category < ActiveRecord::Base
  has_many :tickets
end
