// Title: Poetry Club Door Policy

const assert = require('assert')

function frontDoorResponse (line) {
  return line.slice(0, 1)
}
assert.strictEqual(frontDoorResponse('Stands so high'), 'S')

// ---

function frontDoorPassword (word) {
  let newWord = word.toLowerCase()
  let firstLetter = newWord.slice(0, 1)
  let rest = newWord.slice(1)
  firstLetter = firstLetter.toUpperCase()
  return firstLetter + rest
}

assert.strictEqual(frontDoorPassword('SHIRE'), 'Shire')
assert.strictEqual(frontDoorPassword('shire'), 'Shire')

// ---

function backDoorResponse (line) {
  let newLine = line.trim()
  return newLine.slice(newLine.length - 1, newLine.length)
}
assert.strictEqual(backDoorResponse('Stands so high'), 'h')
assert.strictEqual(backDoorResponse('Stands so high   '), 'h')

// ----

function backDoorPassword (word) {
  return frontDoorPassword(word) + ', please'
}
assert.strictEqual(backDoorPassword('horse'), 'Horse, please')
