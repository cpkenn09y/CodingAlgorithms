// https://leetcode.com/articles/house-robber/
public int rob(int[] num) {
  int prevMax = 0;
  int currMax = 0;
  for (int x : num) {                         //          [4    1    2    7     5     3     1]
    int temp = currMax;                       // temp    = 0 -> 4 -> 4 -> 6  -> 11 -> 11 -> 14
    currMax = Math.max(prevMax + x, currMax); // currMax = 4 -> 4 -> 6 -> 11 -> 11 -> 14 -> 14
    prevMax = temp;                           // prevMax = 0 -> 4 -> 4 -> 6  -> 11 -> 11 -> 14
  }
  return currMax;
}


rob([4,1,2,7,5,3,1])
