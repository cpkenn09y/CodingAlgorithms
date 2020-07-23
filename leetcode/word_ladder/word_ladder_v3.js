// Runtime: 752 ms, faster than 31.91 % of JavaScript online submissions for Word Ladder.
// Memory Usage: 47.1 MB, less than 47.02 % of JavaScript online submissions for Word Ladder.

/**
 * @param {string} beginWord
 * @param {string} endWord
 * @param {string[]} wordList
 * @return {number}
 */
const getAdjacentWords = (word, wordListSet) => {
  const result = [];
  wordListSet.forEach((wordFromList) => {
    let diffCounter = 0;
    for (let j = 0; j < wordFromList.length; j++) {
      if (word[j] !== wordFromList[j]) { diffCounter++ };
    }
    if (diffCounter === 1) { result.push(wordFromList) };
  })
  return result
};

const ladderLength = (beginWord, endWord, wordList) => {
  const usedWords = new Set([beginWord]);
  const wordListSet = new Set(wordList)
  if (!wordListSet.has(endWord)) { return 0 };
  const queue = [beginWord]
  let min_distance = null;
  let distance = 1;
  while (queue.length > 0) {
    let level_size = queue.length
    let n = 0
    while (n < level_size) { // [hit]
      let currWord = queue.shift(); // hit
      if (currWord === endWord) {
        if (min_distance == null || distance < min_distance) {
          console.log("Setting min distance", distance)
          min_distance = distance;
        };
      };
      const adjWords = getAdjacentWords(currWord, wordListSet)
      console.log(`${distance}: ${currWord} --> ${adjWords}`)
      for (let i=0; i < adjWords.length; i++) {
        if (!usedWords.has(adjWords[i])) {
          queue.push(adjWords[i]);
          usedWords.add(adjWords[i]);
          wordListSet.delete(adjWords[i])
        };
      }
      n++
    }
    distance++;
  }
  return min_distance || 0
};


/** Algo Notes
  return 0 if the final word is not present...
  words = { "dot", "dog" } // OPTIMIZATION IDEA...
  set_of_used_words = {"hit", "hot"}
  queue = []
  * "hit"
  -> "hot"
  -> "dot"
  -> "lot"
  keep track of depth...
  return 0 if the unable to reach the final word
  "cog"
*/

console.log(ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]) == 0)
console.log(ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]) == 5);
console.log(ladderLength("red", "tax", ["ted", "tex", "red", "tax", "tad", "den", "rex", "pee"]) == 4);
console.log(ladderLength("teach", "place", ["peale", "wilts", "place", "fetch", "purer", "pooch", "peace", "poach", "berra", "teach", "rheum", "peach"]) == 4);
