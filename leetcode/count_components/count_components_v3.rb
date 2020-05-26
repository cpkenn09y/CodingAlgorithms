class ComponentCounter

  def initialize(n,edges)
    @n = n
    @edges = edges
  end

  # @param {Integer} n
  # @param {Integer[][]} edges
  # @return {Integer}
  def count_components
    @counter = 0
    visited = Array.new(@n)
    adjacency_list.each_with_index do |neighbors,i|
      dfs(i,neighbors,visited,adjacency_list)
    end
    return @counter
  end

  private

  def adjacency_list
    return @adjacency_list if @adjacency_list
    @adjacency_list = Array.new(@n) { Array.new }
    # populate adjacency list
    @edges.each_with_index do |edge,i|
      p1,p2 = edge
      @adjacency_list[p1] << p2
      @adjacency_list[p2] << p1
    end
    return @adjacency_list
  end

  def dfs(i,neighbors,visited,adjacency_list)
    if visited[i]
      # do nothing
    else
      puts "BEGINNING A NEW DFS at #{i}... HERE IS THE VISITED #{visited}"
      @counter += 1
      visit_node_and_neighbors(i,neighbors,visited,adjacency_list)
    end
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

end

p ComponentCounter.new(5, [[0, 1], [1, 2], [3, 4]]).count_components == 2
p ComponentCounter.new(5, [[0, 1], [1, 2], [2, 3], [3, 4]]).count_components == 1
