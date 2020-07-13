require 'pry'
class Trie

  attr_accessor :children, :is_complete_word

  def initialize(char="")
    @children = {}
    @is_complete_word = false
    @char = char
  end


  <<-DOCUMENTATION
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
  DOCUMENTATION
  def insert(word)
    curr_node = self
    i = 0
    word.each_char do |char|
      if curr_node.children[char]
        curr_node = curr_node.children[char]
      else
        new_node = Trie.new(char)
        curr_node.children[char] = new_node
        curr_node = new_node
      end
      if i == word.length - 1
        curr_node.is_complete_word = true
      end
      i += 1
    end
    return nil
  end


  <<-DOCUMENTATION
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
  DOCUMENTATION
  def search(word)
    curr_node = self
    word.each_char do |char|
      if curr_node.children[char]
        curr_node = curr_node.children[char]
      else
        return false
      end
    end
    return curr_node.is_complete_word
  end


  <<-DOCUMENTATION
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
  DOCUMENTATION
  def starts_with(word)
    curr_node = self
    word.each_char do |char|
      if curr_node.children[char]
        curr_node = curr_node.children[char]
      else
        return false
      end
    end
    return true # NOTE: Refactor to reuse with search
  end


end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)

trie = Trie.new
trie.insert("apple")
p trie.search("apple") == true
p trie.search("app") == false
p trie.starts_with("app")== true
trie.insert("app")
p trie.search("app") == true
