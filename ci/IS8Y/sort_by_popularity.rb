class Item

  attr_reader :title, :popularity, :price

  def initialize(title:, popularity:, price:)
    @title = title
    @popularity = popularity
    @price = price
  end

end

POPULARITY_WEIGHT = 1000000000
PRICE_WEIGHT = 0.1

def sort_by_popularity(list)
  items = []
  list.sort_by do |row|
    split_row = row.split(",")
    title = split_row[0]
    popularity = split_row[1].to_i
    price = split_row[2].to_i
    items << Item.new(title: title, popularity: popularity, price: price)
  end
  items.sort_by! do |item|
    sort_score = (item.popularity * POPULARITY_WEIGHT - item.price * PRICE_WEIGHT) * -1
    puts "#{item.title} #{sort_score}"
    sort_score
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
  "iPhone 4b, 5555, 281", # 5555000 - 281
  "iPhone 3a, 5555, 222", # 5555000 - 222
  "Easy-Bake Oven, 5555,100", # 5555000 - 100
  "iPhone 5, 5555, 299", # 5555000 - 299
  "iPhone 7, 7777, 599", # 7777000
  "iPhone 8, 8888, 799", # 8888000
]

sort_by_popularity(list)

# EXPECTED PRINT RESULT:
# "iPhone 8" # most popular
# "iPhone 7" # 2nd most popular
# "Easy-Bake Oven" # tied in popularity, but is 1st cheapest
# "iPhone 3a" # tied in popularity, but is 2nd cheapest
# "iPhone 4b" # tied in popularity, but is 3rd cheapest
# "iPhone 5" # tied in popularity, but is 4th cheapest
