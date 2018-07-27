class Product < ApplicationRecord
  has_many :variants, dependent: :destroy
  accepts_nested_attributes_for :variants

  # TODO
  # add validations

  def to_param
    name
  end
end
