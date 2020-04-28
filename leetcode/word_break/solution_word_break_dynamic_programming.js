var wordBreak = function (s, wordDict) {
  let dp = new Array(s.length + 1).fill(false);
  dp[0] = true;
  for (let i = 1; i <= s.length; i++) {
    for (let j = 0; j < i; j++) {
      const subStr = s.substring(j, i);
      if (dp[j] && wordDict.includes(subStr)) {
        dp[i] = true;
        break;
      }
    }
  }
  return dp[s.length];
};
