// Title: Elyses Destructured Enchantments

const assert = require('assert')

function getFirstCard (deck) {
  const [first, ...rest] = deck
  return first
}
assert.strictEqual(getFirstCard([5, 9, 7, 1, 8]), 5)

// ----

function getSecondCard (deck) {
  const [first, second, ...rest] = deck
  return second
}
assert.strictEqual(getSecondCard([3, 2, 10, 6, 7]), 2)

// ----

function swapTopTwoCards (deck) {
  const [first, second, ...rest] = deck
  return [second, first, ...rest]
}
assert.deepStrictEqual(swapTopTwoCards([10, 7, 3, 8, 5]), [7, 10, 3, 8, 5])

// ----

function discardTopCard (deck) {
  const [first, ...rest] = deck
  return [first, [...rest]]
}
assert.deepStrictEqual(discardTopCard([2, 5, 4, 9, 3]), [2, [5, 4, 9, 3]])

// ----

const FACE_CARDS = ['jack', 'queen', 'king']
function insertFaceCards (deck) {
  const [first, ...rest] = deck
  return [first, ...FACE_CARDS, ...rest]
}
assert.deepStrictEqual(insertFaceCards([5, 4, 7, 10]), [
  5,
  'jack',
  'queen',
  'king',
  4,
  7,
  10
])
