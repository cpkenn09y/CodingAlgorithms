var VOWELS = ['a', 'e', 'i', 'o', 'u']

function translateToPigLatin(input) {
  var pigLatinAnswer = []
  var separatedBySpaces = input.split(' ')
  separatedBySpaces.forEach(function(element){
    pigLatinAnswer.push(translateWord(element))
  })
  return pigLatinAnswer.join(' ')
}

function translateWord(word) {
  var lowerCasedWord = word.toLowerCase()
  if (startWithVowel(lowerCasedWord)) {
    var pattern = /([aeiou])(\W?\w+)/
    var pigLatinWord = lowerCasedWord.replace(pattern, "$2$1hay")
  } else {
    var pattern = /^(\S)(\w*)/
    var pigLatinWord = lowerCasedWord.replace(pattern, "$2$1ay")
  }
  if (startWithCapital(word)) { pigLatinWord = pigLatinWord[0].toUpperCase() + pigLatinWord.slice(1) }
  return pigLatinWord
}

function startWithCapital(word) {
  if (word[0].match(/[A-Z]/)) { return true } else { return false }
}

function startWithVowel(word) {
  return VOWELS.indexOf(word[0]) >= 0
}

console.log(translateToPigLatin('Hello') == 'Ellohay')
console.log(translateToPigLatin('Another') == 'Notherahay')
phrase = "Bacon is awesome! Sometimes, in the morning, I’ll have bacon on toast for breakfast."
phrase_answer = "Aconbay sihay wesomeahay! Ometimessay, nihay hetay orningmay, ’llihay avehay aconbay nohay oasttay orfay reakfastbay."
console.log(translateToPigLatin(phrase) == phrase_answer)

// Make the other three methods into private methods
// Have the return value be the function that we want allowed in to be public
// Turn it into a module.... something to the effect of PigLatin.translate()
// use a switch instead of so many if statements, also make it more scalable incase want to add more patterns...