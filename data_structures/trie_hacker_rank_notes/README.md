<!-- Based on: https://www.youtube.com/watch?v=zIjfhVPRZCg -->
Create a Trie based on my_dictionary

my_dictionary = ["car", "card", "cards", "cot", "cots", "trie", "tried", "tries", "try"]


t = Trie.new(my_dictionary)
p t.is_valid?("car") == true
p t.is_valid?("carz") == false


Example Usages for Trie:
* Walk through this scrabble board and find all the words...
* Given a list of strings, find all celebrity names

An optimization that often comes up in Trie problems:
* user is typing a word, and as soon as it becomes invalid, highlight it...
* eg.
