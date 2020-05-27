<<-NOTES
  Going to use the #sort_by comparator

  * Really GREAT ARTICLE on SORTING: https://mixandgo.com/learn/ruby-sort-and-sort-by
NOTES

class Item

  attr_reader :title, :popularity, :price

  def initialize(title:, popularity:, price:)
    @title = title
    @popularity = popularity
    @price = price
  end

end

def sort_by_popularity(list)
  items = []
  list.each do |row|
    split_row = row.split(",")
    title = split_row[0]
    popularity = split_row[1].to_i
    price = split_row[2].to_i
    items << Item.new(title: title, popularity: popularity, price: price)
  end
  items.sort_by! do |item|
    # Primary Sort  : by popularity DESC
    # Secondary Sort: by price ASC
    [-item.popularity,item.price]
  end
  items.each do |item|
    puts item.title
  end
end

# list = [
#   "Easy-Bake Oven, 5555,100",
#   "iPhone 5, 5555, 299",
#   "iPhone 7, 7777, 599",
#   "iPhone 8, 8888, 799",
# ]

# sort_by_popularity(list)

# EXPECTED PRINT RESULT:
# "iPhone 8" # most popular
# "iPhone 7" # 2nd most popular
# "Easy-Bake Oven" # tied in popularity, but is cheaper
# "iPhone 5" # tied in popularity, but is more expensive

list = [
  "iPhone 4b, 5555, 281",
  "iPhone 3a, 5555, 222",
  "Easy-Bake Oven, 5555,100",
  "iPhone 5, 5555, 299",
  "iPhone 7, 7777, 599",
  "iPhone 8, 8888, 799",
]

sort_by_popularity(list)

# EXPECTED PRINT RESULT:
# "iPhone 8" # most popular
# "iPhone 7" # 2nd most popular
# "Easy-Bake Oven" # tied in popularity, but is 1st cheapest
# "iPhone 3a" # tied in popularity, but is 2nd cheapest
# "iPhone 4b" # tied in popularity, but is 3rd cheapest
# "iPhone 5" # tied in popularity, but is 4th cheapest
