class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
