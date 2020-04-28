<<-METRICS
  start @12:20pm
METRICS

<<-QUESTIONS
  Q: How to best construct the tree based on the array...?
QUESTIONS

def get_row(node_vals,i,number_of_elements,should_reverse)
  row = node_vals.slice(i,number_of_elements)
  row.reverse! if should_reverse
  row.compact
end

def binary_tree_zigzag_order_traversal(node_vals)
  i = 0
  number_of_elements = 1
  result = []
  should_reverse = false
  while (i < node_vals.length) do
    result << get_row(node_vals,i,number_of_elements,should_reverse) # [[3],[20,9]]
    i += number_of_elements
    number_of_elements *= 2
    should_reverse = !should_reverse
  end
  result
end

input = [3,9,20]
answer = [
  [3],
  [20,9]
]
p binary_tree_zigzag_order_traversal(input) == answer

input = [3,9,20,1,2,15,7]
answer = [
  [3],
  [20,9],
  [1,2,15,7]
]
p binary_tree_zigzag_order_traversal(input) == answer

input = [3,9,20,nil,nil,15,7]
answer = [
  [3],
  [20,9],
  [15,7]
]
p binary_tree_zigzag_order_traversal(input) == answer
