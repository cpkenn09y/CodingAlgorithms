# Offers to BUY: 100, 100, 99, 99, 97, 90
# Offers to SELL: 109, 110, 110, 114, 115, 119# Enter your code here. Read input from STDIN. Print output to STDOUT

class Market

    attr_reader :sells, :buys

    def initialize
        @sells = [] #=> [115, 120]
        @buys = [] #=> [100, 90, 80]
    end

    def offer_sell(sell_value)
        best_sell_price = nil # 100
        best_sell_price_index = nil # 1
        @buys.each_with_index do |buy_value,index|
            if buy_value > sell_value # 90 > 10
                if best_sell_price.nil?
                    best_sell_price = buy_value
                    best_sell_price_index = index
                elsif buy_value > best_sell_price # 90 > 100
                    best_sell_price = buy_value
                    best_sell_price_index = index
                end
            end
        end
        if best_sell_price
            @buys.delete_at(best_sell_price_index)
        else
            @sells << sell_value
        end
    end

    def offer_buy(value)
        # 300
        # Is the value offered > sell price... minimum sell price price possible #=> 110
        @sells #=> [110, 115, 120]
        best_sell_price = nil #=> 110
        best_sell_price_index = nil
        @sells.each_with_index do |price, index|
            if price < value # 115 < 300
                if best_sell_price.nil?
                    best_sell_price = price
                    best_sell_price_index = index
                    puts "Found a viable buy #{best_sell_price}"
                elsif price < best_sell_price # 115 < 110
                    # the current sell price is not better than a previous one found
                end
            end
        end
        if best_sell_price
            @sells.delete_at(best_sell_price_index)
            puts "Update the sells to no longer have #{best_sell_price}. #{@sells}"
            return best_sell_price
        else
            @buys << value
        end
    end

end
market = Market.new
<<-SETUP
SETUP
market.offer_sell(110)
market.offer_sell(115)
market.offer_sell(120)
market.offer_buy(100)
market.offer_buy(90)
market.offer_buy(80)
<<-TESTS
TESTS
# SELLS:
# * 110
# * 115
# * 120
p market.offer_buy(300) == 110
p market.sells #=> [115, 120]
p market.buys #=> [100, 90, 80]
p market.offer_sell(10) == 100


# buys = [100, 90, 80]
# sells = [110, 115, 200]

# buy offer @ 300 -- matched w/ 110 sell

# buys = [100, 90, 80]
# sells = [115, 200]

# sell offer @ 10 --- matched w/ 100 buy

# buys = [90, 80]
# sells = [115, 200]

# sell @ 300 -- no match

# buys = [90, 80]
# sells = [300, 115, 200]
