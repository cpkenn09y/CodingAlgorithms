class Node

  attr_accessor :val, :adjacent_nodes

  def initialize(val)
    @val = val
    @adjacent_nodes = []
  end

  def add_edge(adjacent_node)
    @adjacent_nodes << adjacent_node
  end

end

<<-METRICS
  SPACE COMPLEXITY = O(n) where n is the number of nodes
  TIME COMPLEXITY  = O(n * m) where n is the number of connections, and m is the max number of edges

  NOTE: for simplicity, I believe we can just call the time complexity O(n^2)
METRICS
def critical_connections(n,connections)
  nodes = {}
  number_of_edges = {}
  node_values_with_only_one_edge = []
  critical_edges = []
  i = 0
  while (i < n) do
    nodes[i] = Node.new(i)
    number_of_edges[i] = 0
    i += 1
  end
  connections.each do |edge|
    vertex,endpoint = edge
    nodes[vertex].add_edge(nodes[endpoint])
  end
  nodes.values.each do |node|
    node.adjacent_nodes.each do |end_node|
      number_of_edges[node.val] += 1 # { 1: 1 }
      number_of_edges[end_node.val] += 1 # { 1: 1 }
    end
  end

  number_of_edges.each do |k,v| # { 3: 1 }
    if v == 1
      node_values_with_only_one_edge << k # can use this to find that #3 only has one edge...
    end
  end

  # finally, loop over the orignal connections to determine which of them referenced #3
  node_values_with_only_one_edge.each do |val|
    connections.each do |edge|
      vertex,end_point = edge
      if vertex == val || end_point == val
        critical_edges << edge
      end
    end
  end
  critical_edges
end

connections = [[0,1],[1,2],[2,0],[1,3]]
p critical_connections(4, connections)


<<-MAPPING_THINGS_OUT
  n0.adjacent_nodes #=> [n1]
  n1.adjacent_nodes #=> [n2,n3]
  n2.adjacent_nodes #=> [n0]

  Plan is:
  * iterate over each node...
  * IF only 1 edge exists to a node...
  * then that edge is critical

  find_critical_edge...

  n0,n1,n2,n3

  number_of_edges: {
    0: 2
    1: 2
    2: 2
    3: 1
  }

  n0 = Node.new(0)
  n1 = Node.new(1)
  n2 = Node.new(2)
  n3 = Node.new(3)

  n0.add_edge(n1)
  n1.add_edge(n2)
  n2.add_edge(n0)
  n1.add_edge(n3)
MAPPING_THINGS_OUT


<<-ANOTHER_STRATEGY
  loop over list to create number_of_edges... O(n)
  if number_of_edges == 1... O(n)
    get the Node number # eg. 3
  end
  loop of original list to determine which edge references this particular node... # eg. [1,3]
ANOTHER_STRATEGY
