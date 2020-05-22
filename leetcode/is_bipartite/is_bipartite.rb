# reference: https://www.youtube.com/watch?v=mVmXwFkgoJ0

def helper(graph, src, color_array)
  color_array[src] = 1
  # Create a queue (FIFO) of vertex numbers and enqueue
  #  source vertex for BFS traversal
  q = []
  while (!q.empty?) do
    # dequeue a vertex from queue
    u = q.shift

    # return false if there is a self-loop
    if graph[u][u] == 1
      return false
    end

    v = 0
    while (v < V) do

      v += 1
    end
  end
end

def is_bipartite?(graph)
  color_array = Array.new(graph.length)
  i = 0
  while (i < V) do
    color_array[i] = -1
    i += 1
  end
  i = 0
  while (i < V) do
    if color_array[i] == -1
      if helper(graph, i, colorArray) == false
        return false
      end
    end
    i += 1
  end
  return true
end


