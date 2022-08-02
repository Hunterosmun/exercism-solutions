// Title: Elyses Transformative Enchantments

const assert = require('assert')

function seeingDouble (deck) {
  return deck.map(el => el * 2)
}
assert.deepStrictEqual(seeingDouble([1, 2, 3, 4, 10]), [2, 4, 6, 8, 20])

// -----

function threeOfEachThree (deck) {
  return deck.flatMap(el => (el === 3 ? [el, el, el] : el))
}
const deck2 = [1, 3, 9, 3, 7]
assert.deepStrictEqual(threeOfEachThree(deck2), [1, 3, 3, 3, 9, 3, 3, 3, 7])

// ----

function middleTwo (deck) {
  return deck.splice(4, 2)
}
const deck3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
assert.deepStrictEqual(middleTwo(deck3), [5, 6])

// ----

function sandwichTrick (deck) {
  let newDeck = deck.slice(1, deck.length - 1)
  newDeck.splice(deck.length / 2 - 1, 0, deck[deck.length - 1], deck[0])
  return newDeck
}
const deck4 = [1, 2, 3, 5, 6, 10]
assert.deepStrictEqual(sandwichTrick(deck4), [2, 3, 10, 1, 5, 6])

// ----

function twoIsSpecial (deck) {
  return deck.filter(el => el === 2)
}
assert.deepStrictEqual(twoIsSpecial([1, 2, 3, 4, 10, 2]), [2, 2])

// ----

function perfectlyOrdered (deck) {
  return deck.sort((a, b) => a - b)
}
const deck6 = [10, 1, 5, 3, 2, 8, 7]
assert.deepStrictEqual(perfectlyOrdered(deck6), [1, 2, 3, 5, 7, 8, 10])

// ----

function reorder (deck) {
  return deck.reverse()
}
assert.deepStrictEqual(reorder([10, 1, 5, 3, 2]), [2, 3, 5, 1, 10])
