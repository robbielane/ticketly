class Event < ActiveRecord::Base
  has_many :tickets
  belongs_to :category
end
