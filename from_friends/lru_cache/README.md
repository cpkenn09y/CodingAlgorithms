/*
LRU cache
Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
lru = LRUCache(2)
lru.put(‘a’, 1);
lru.put(‘b’, 2);
lru.put(‘c’, 3); // ‘a’ will be evicted
lru.get(‘b’) // return 2
lru.put(‘d’, 4); // ‘c’ will be evicted
