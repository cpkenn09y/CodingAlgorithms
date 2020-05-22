var isBipartite = function(graph) {
  const visited = new Array(graph.length).fill(false)
  const colors = new Array(graph.length)
  for (let i=0; i < graph.length; i++) {
    if (!visited[i]) {
      if (!biPartiteHelper(i, visited, colors, 0, graph)) return false
    }
  }
  return true
};
const biPartiteHelper = (node, visited, colors, color, graph) => {
  visited[node] = true
  colors[node] = color
  const adjacents = graph[node]
  for (let i=0; i < adjacents.length; i++) {
    if (!visited[adjacents[i]]){
      if (!biPartiteHelper(adjacents[i], visited, colors, color^1, graph)) {
        return false
      }
    } else {
      if (colors[node] === colors[adjacents[i]]) {
        return false
      }
    }
  }
  return true
}
let graph
graph = [[1,3], [0,2], [1,3], [0,2]]
console.log(isBipartite(graph) === true)
graph = [[0,2], [0,1,3], [0,2]]
console.log(isBipartite(graph) === false)
graph = [[1,2,3], [0,2], [0,1,3], [0,2]]
console.log(isBipartite(graph) === false)
graph = [[4],[],[4],[4],[0,2,3]]
console.log(isBipartite(graph) === true)
/*
   1 - 2
     /
   3 - 4
   adjacency list: given a node, what are the nodes that are adjacent to this node
   dfs traversal
   graph[i] is a list of indexes j
   graph[0] = [1,3]
   graph[1] = [0,2]
              0      1      2      3
   graph = [[1,3], [0,2], [1,3], [0,2]]
   A   B
   0 - 1
   0 - 3
   Node 0 has a color property of 1
   Node 1 should have a color property that is (not 1) 0
   Node 3 should have a color property that is (not 1) 0
   if 1 had an edge to 3, since 1 has color property of 0, 3 should have color property of 1
*/
