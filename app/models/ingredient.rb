class Ingredient < ApplicationRecord
  has_many :doses #, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  scope :ordered, -> { order(name: :asc) }
  has_one_attached :photo
end

