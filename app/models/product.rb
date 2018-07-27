class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  accepts_nested_attributes_for :variants
  validates :name, uniqueness: true, presence: true
  validates :price, numericality: {greater_than: 0}

  def to_param
    name
  end
end
