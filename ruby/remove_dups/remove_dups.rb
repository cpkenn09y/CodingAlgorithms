# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  clean_list = []
  last_seen_value = nil
  nums.each do |integer| # [1,1,2]
    if integer == last_seen_value
      # skip
    else
      last_seen_value = integer
      clean_list << integer
    end
  end
  clean_list.length
end
