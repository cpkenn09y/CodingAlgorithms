<<-NOTES
  This is a solution that does not use a Node class and instead just solves the problem algorithmically
NOTES

<<-METRICS
  SPACE COMPLEXITY = O(n) where n is the number of nodes
  TIME COMPLEXITY  = O(n * m) where n is the number of connections, and m is the max number of edges

  NOTE: for simplicity, I believe we can just call the time complexity O(n^2)
METRICS
def critical_connections(n,connections)
  edge_counter = {}
  critical_edges = []
  node_vals_with_only_one_edge = []
  i = 0
  while (i < n) do
    edge_counter[i] = 0
    i += 1
  end
  connections.each do |edge|
    vertex,endpoint = edge
    edge_counter[vertex] += 1
    edge_counter[endpoint] += 1
  end
  edge_counter.each do |node_val,num_of_edges|
    if num_of_edges == 1
      node_vals_with_only_one_edge << node_val
    end
  end
  node_vals_with_only_one_edge.each do |node_val|
    connections.each do |edge|
      vertex,endpoint = edge
      if (vertex == node_val || endpoint == node_val)
        critical_edges << edge
      end
    end
  end
  critical_edges
end

<<-ANOTHER_STRATEGY
  loop over list to create number_of_edges... O(n)
  if number_of_edges == 1... O(n)
    get the Node number # eg. 3
  end
  loop of original list to determine which edge references this particular node... # eg. [1,3]
ANOTHER_STRATEGY


connections = [[0,1],[1,2],[2,0],[1,3]]
p critical_connections(4, connections) == [[1,3]]


connections = [[0,1],[1,2],[2,0],[1,3],[3,4],[4,5],[5,3]]
critical_connections(6, connections)
