# Start time 11:22am
# Start time 11:59am

require 'pry'
class LRUCache

  def initialize(capacity)
    @capacity = capacity
    @recently_used_keys = [] #=> ["a", "b", "a"]
    @cache = {}              # {"b"=>2}
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

  def evict_old_keys
    keys_to_keep = @recently_used_keys.slice(@recently_used_keys.length-@capacity+1,@capacity-1) #=>["b"]
    @cache.each do |key,value|
      if keys_to_keep.include?(key)
        # puts "keeping '#{key}'"
      else
        puts "deleted '#{key}'"
        @cache.delete(key)
      end
    end
    @recently_used_keys = keys_to_keep
  end

  def put(key, value)
    if @cache.length >= @capacity
      evict_old_keys
    end
    @recently_used_keys << key
    puts "Added #{key}"
    @cache[key] = value
  end

  def get(key)
    @recently_used_keys << key
    @cache[key] || -1
  end

end

lru = LRUCache.new(2)
lru.put('a', 1);
lru.put('b', 2);
lru.put('c', 3); # 'a' will be evicted
lru.get('b')     # return 2
lru.put('d', 4); # 'c' will be evicted

