def is_bipartite_v2(graph)
  n = graph.length
  color = Array.new(n) { -1 }

  start = 0
  while start < n do
    if color[start] == -1
      stack = []
      stack.push(start)
      color[start] = 0
      while (!stack.empty?) do
        node = stack.pop
        for (int nei: graph[node]) {
          if (color[nei] == -1) {
            stack.push(nei);
            color[nei] = color[node] ^ 1;
          } elsif (color[nei] == color[node]) {
            return false;
          }
        }
      end
    end
    start += 1
  end
end
