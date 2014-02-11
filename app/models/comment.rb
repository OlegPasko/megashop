class Comment < ActiveRecord::Base
  belongs_to :product
  validates_presence_of :name, :content, :mark
  validates_numericality_of :mark, greater_than: 0, less_than: 6

end
