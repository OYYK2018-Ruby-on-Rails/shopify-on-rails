# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

product_names = %w(shirt jean short sock swim sweater jacket skirt dress vest swimsuit)
variant_names = %w(small medium large)

product_names.each.with_index(1) do |product_name, i|
  product = Product.create(name: product_name, price: i**4)
  variant_names.each do |variant_name|
    product.variants.create(name: variant_name, stock: 2*i)
  end
end
