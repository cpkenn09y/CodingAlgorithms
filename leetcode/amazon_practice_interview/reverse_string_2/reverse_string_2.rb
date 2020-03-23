def reverse_string_2(str,k)
  i = 0
  final_str = ""
  should_swap = true
  while (i < str.length) do
    if should_swap
      final_str += str[i..i+k-1].reverse
    else
      final_str += str[i..i+k-1]
    end
    should_swap = !should_swap
    i += k
  end
  final_str
end

str = "abcdefg"
reverse_string_2(str,2) == "bacdfeg"
<<-WORKING_WITH_THE_DATA
  0123456
  abcdefg
  ba
    cd
      fe
        g

  INDEXES TO SWAP     = 0,4
  INDEXES TO NOT SWAP = 2,6
WORKING_WITH_THE_DATA
