# Time Spent: Started at 11:05am. Ended at 11:16am. Therefore, spent 11 mins
# Time Complexity : O(nm) where n is the number of elements in intervals and m is the distance between the largest touple
# Space Complexity: O(n) b/c num_counter could get populated with n number of key-value pairs

# @param {Integer[][]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
  max_count = 0
  num_counter = {}
  intervals.each do |interval|
    start,end_num = interval
    while (start < end_num) do
      if num_counter[start]
        # increment
        num_counter[start] += 1
      else
        # does not exist, set to 1
        num_counter[start] = 1
      end
      if num_counter[start] > max_count
        # set max_count to the greatest number of occurences
        max_count = num_counter[start]
      end
      start += 1
    end
  end
  max_count
end

p min_meeting_rooms([[0, 30],[5, 10],[15, 20]]) == 2
p min_meeting_rooms([[7,10],[2,4]]) == 1
<<-PLAN
  max_count = 0
  {
    0 => 1
    1 => 1
  }
  LOOP over list
  return max_count
PLAN

<<-TEST_CASES
  Input: [[0, 30],[5, 10],[15, 20]]
  Output: 2

  Input: [[7,10],[2,4]]
  Output: 1
TEST_CASES

