class Node

  def initialize
    @children = []
    @is_complete_word = false
  end

end

class Trie
end

my_dictionary = ["car", "card", "cards", "cot", "cots", "trie", "tried", "tries", "try"]
t = Trie.new(my_dictionary)
p t.is_valid?("car") == true
p t.is_valid?("carz") == false
