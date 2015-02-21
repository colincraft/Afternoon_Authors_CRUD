class Book < ActiveRecord::Base
  belongs_to :writer
  validates :title, presence: true
end
