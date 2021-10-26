# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'

## MERCHANTS

puts "Finding or Creating Merchants ..."

mer1 = Merchant.find_or_create_by! name: 'Asus'
mer2 = Merchant.find_or_create_by! name: 'Emyuid'
mer3 = Merchant.find_or_create_by! name: 'VansClub Indonesia'

## PRODUCTS

puts "Re-creating Product ..."

Product.destroy_all

prod1 = Product.find_or_create_by!({
  name:  'T-shirt Manchester United',
  category_id: cat1.id,
  merchant_id: mer2.id
})

prod2 = Product.find_or_create_by!({
  name:  'Sepatu Vans',
  category_id: cat1.id,
  merchant_id: mer3.id
})

prod3 = Product.find_or_create_by!({
  name:  'Laptop Asus',
  category_id: cat2.id,
  merchant_id: mer1.id
})

## VARIANTS

puts "Re-creating Variants ..."

Variant.destroy_all

Variant.create!({
  name:  'Home',
  description: Faker::Hipster.paragraph(4),
  quantity: 22,
  price: 250,
  product_id: prod1.id
})

Variant.create!({
    name:  'Away',
    description: Faker::Hipster.paragraph(4),
    quantity: 15,
    price: 200,
    product_id: prod1.id
})

Variant.create!({
    name:  'Limited Edition',
    description: Faker::Hipster.paragraph(4),
    quantity: 10,
    price: 100,
    product_id: prod2.id
})

Variant.create!({
    name:  'Asus ROG X10S',
    description: Faker::Hipster.paragraph(4),
    quantity: 2,
    price: 500,
    product_id: prod3.id
})