# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
  # find all 2's
  # create a subarray of the remaining...
  # recurse to find the next set number
  def helper(remaining,arr2,i,sorted_array:[])
    if remaining.length == 0
      return sorted_array
    end
    sub_array = []
    if i < arr2.length
      remaining.each do |num|
        if (num == arr2[i])
          sorted_array << arr2[i]
        else
          sub_array << num
        end
      end
    else
      sorted_array += remaining.sort #=> [6, 7, 19]
      remaining = []
    end
    helper(
      sub_array,
      arr2,
      i+1,
      sorted_array: sorted_array
    )
  end
  helper(arr1,arr2,0)
end

# p relative_sort_array([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9])



# arr1 = [2,3,1,3,2,4,6,7,9,2,19]
# arr2 = [2,1,4,3,9,6]
# result = [2,2,2,1,4,3,3,9,6,7,19]

