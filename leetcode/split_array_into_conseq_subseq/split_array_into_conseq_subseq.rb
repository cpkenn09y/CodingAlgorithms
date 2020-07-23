def add_to_bucket(index, num, buckets)
  if buckets[index]
    buckets[index] << num # { 0 = [1,2,3], 1 = [3] }
  else
    buckets[index] = [num] # { 0 = [1...], 1 = [3...] }
  end
end

# @param {Integer[]} nums
# @return {Boolean}
def is_possible(nums)
  n_last_seen = nums[0]
  bucket_index = 0
  buckets = {}
  add_to_bucket(bucket_index,n_last_seen,buckets)
  i = 1
  while (i < nums.length) do
    n = nums[i]
    if n_last_seen + 1 == n
      add_to_bucket(bucket_index,n,buckets)
      n_last_seen = n
    elsif n_last_seen == n
      bucket_index += 1
      add_to_bucket(bucket_index,n,buckets)
    end
    i += 1
  end
  p buckets
  return buckets[bucket_index].length >= 3
end

module TestSuite

  # Explanation:
  # You can split them into two consecutive subsequences :
  # 1, 2, 3
  # 3, 4, 5
  def self.t1
    p is_possible([1,2,3,3,4,5]) == true
  end

  # You can split them into two consecutive subsequences :
  # 1, 2, 3, 4, 5
  # 3, 4, 5
  def self.t2
    p is_possible([1,2,3,3,4,4,5,5]) == true
  end

  # False
  def self.t3
    p is_possible([1,2,3,4,4,5])# == false
  end

  def self.run_tests
    # t1
    t2
    # t3
  end

end

TestSuite.run_tests

