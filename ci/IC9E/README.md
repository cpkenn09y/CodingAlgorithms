You operate a marketplace for buying & selling used textbooks. For a given textbook, e.g. “Theory of Cryptography,” there are people who want to buy this textbook and people who want to sell.

Offers to BUY: $100, $100, $99, $99, $97, $90

Offers to SELL: $109, $110, $110, $114, $115, $119



A match occurs when two people agree on a price. Some new offers do not match. These offers should be added to the active set of offers. For example:

Tim offers to SELL at $150. This will not match. No one is willing to buy at that price so we save the offer.

Offers to SELL:: $109, $110, $110, $114, $115, $119, $150



When matching we want to give the customer the “best price”. Example matches:



If Jane offers to BUY at $120, she will match and buy a book for $109 (the lowest offer to sell is the best price). The sell offers should be updated to reflect the match

Offers to SELL: $110, $110, $114, $115, $119, $150



If Connie offers to SELL at $99 she will match and sell her book for $100 (the highest offer to buy is the best price). The buy offers should be updated to reflect the match

Offers to BUY: $100, $99, $99, $97, $90



Our system will need to:

Accept incoming offers to buy & sell

Output if the price matches

Keep an updated collections of buys & sells



offers_to_buy = [150,160,170] #
sell_request(99) == 170       # Connie gets $170

