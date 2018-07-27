class Product < ApplicationRecord
  has_many :variants, -> { where('stock > 0') }, dependent: :destroy
  accepts_nested_attributes_for :variants

  # tekrar aynı isimle product eklenmesini engellemek için  name alanı uniq olarak validate ediliyor
  validates :name, :uniqueness => true

  # TODO
  # add validations

  def to_param
    name
  end
end
