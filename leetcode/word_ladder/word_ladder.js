/**
 * @param {string} beginWord
 * @param {string} endWord
 * @param {string[]} wordList
 * @return {number}
 */
const getAdjacentWords = (word, wordList) => {
  const result = [];
  for (let i=0; i < wordList.length; i++) {
    let diffCounter = 0;
    for (let j=0; j < wordList[i].length; j++) {
      if (word[j] !== wordList[i][j]) { diffCounter ++ };
    }
    if (diffCounter === 1) { result.push(wordList[i]) };
  }
  return result
};

const ladderLength = (beginWord, endWord, wordList) => {
  const usedWords = new Set([beginWord]);
  if (!wordList.includes(endWord)) { return 0 };
  const queue = [beginWord]
  let min_distance = null;
  let distance = 1;
  while (queue.length > 0) {
    distance++
    let currWord = queue.shift();
    const adjWords = getAdjacentWords(currWord, wordList)
    console.log(`${distance}: ${currWord} --> ${adjWords}`)
    for (let i=0; i < adjWords.length; i++) {
      if (adjWords[i] === endWord) {
        if (min_distance == null || distance < min_distance) {
          console.log("Setting min distance", distance)
          min_distance = distance;
        };
      };
      if (!usedWords.has(adjWords[i])) {
        queue.push(adjWords[i]);
        usedWords.add(adjWords[i]);
      };
    }
  }

  return min_distance || 0
};

// console.log(ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]) == 0)
console.log(ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))// == 5);
// console.log(ladderLength("red", "tax", ["ted", "tex", "red", "tax", "tad", "den", "rex", "pee"]) == 4);
// console.log(ladderLength("teach", "place", ["peale", "wilts", "place", "fetch", "purer", "pooch", "peace", "poach", "berra", "teach", "rheum", "peach"]) == 4);
