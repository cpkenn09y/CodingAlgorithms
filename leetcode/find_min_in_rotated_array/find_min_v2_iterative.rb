# Time Complexity: O(log(n))
# Space Complexity: O(1)


# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  return nums[0] if nums.length == 1

  left = 0
  right = nums.length - 1

  # if last element is greater than the first element, then there is no rotation
  if nums[right] > nums[0]
    return nums[0]
  end

  while right >= left do
    # Find the mid element
    mid = left + (right - left) / 2 # good way to determine the middle

    # if the mid element is greater than its next element then mid+1 element is the smallest
    # This point would be the point of change. From higher to lower value.
    if nums[mid] > nums[mid+1] # eg. 7,2
      return nums[mid+1]

    # if the mid element is lesser than its previous element then mid element is the smallest
    if nums[mid-1] > nums[mid] # eg. 7,2
      return nums[mid]

    # if the mid elements value is greater than the 0th element this means
    # the least value is still somewhere to the right as we are still dealing with elements greater than nums[0]
    if nums[mid] > nums[0]
      left = mid + 1
    else
    # if nums[0] is greater than the mid value then this means the smallest value is somewhere to the left
      right = mid - 1
    end
  end
end


find_min([4,5,6,7,2,3]) == 2
# find_min([3,4,5,1,2]) = 1
