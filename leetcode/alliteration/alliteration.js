function isAlliteration(phrase) {
  var splitPhrase = phrase.split(' ')
  var startingLetterOfPhrase = []
  var startingLetters = []
  for (var i=0; i<splitPhrase.length; i++) {
    startingLetterOfPhrase.push(splitPhrase[0][0])
    startingLetters.push(splitPhrase[i][0])
  }
  return startingLetterOfPhrase.join('') == startingLetters.join('')
}

cowPhrase = 'crazy cows consume cookies'

console.log(isAlliteration(cowPhrase) == true)

skyHigh = 'sky high stacks'

console.log(isAlliteration(skyHigh) == false)