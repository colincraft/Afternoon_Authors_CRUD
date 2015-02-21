class Writer < ActiveRecord::Base
  validates :name, length: {in: 2..20}, presence: true
  has_many :books, dependent: :destroy
end
