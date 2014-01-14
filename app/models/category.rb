class Category < ActiveRecord::Base
  has_many :products
  validates_presence_of :name, :position
  validates_numericality_of :position

  scope :sorted, -> { order(:position) }
end
