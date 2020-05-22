def dfs(counter,i,neighbors,visited,adjacency_list)
  if visited[i]
    # do nothing
  else
    puts "BEGINNING A NEW DFS at #{i}... HERE IS THE VISITED #{visited}"
    counter += 1
    visit_node_and_neighbors(i,neighbors,visited,adjacency_list)
  end
  return counter
end

def visit_node_and_neighbors(i,neighbors,visited,adjacency_list)
  if visited[i]
    # do nothing
  else
    visited[i] = true
    neighbors.each do |j|
      visit_node_and_neighbors(j,adjacency_list[j],visited,adjacency_list)
    end
  end
end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def count_components(n, edges)
  counter = 0
  visited = Array.new(n)
  adjacency_list = Array.new(n) { Array.new }
  # populate adjacency list
  edges.each_with_index do |edge,i|
    v1,v2 = edge
    adjacency_list[v1] << v2
    adjacency_list[v2] << v1
  end
  # DFS
  adjacency_list.each_with_index do |neighbors,i|
    counter = dfs(counter,i,neighbors,visited,adjacency_list)
    puts "COUNTER #{counter}"
  end
  return counter
end

p count_components(5, [[0, 1], [1, 2], [3, 4]]) == 2
p count_components(5, [[0, 1], [1, 2], [2, 3], [3, 4]]) == 1
