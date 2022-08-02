// Title: Elyses Enchantments

const assert = require('assert')

function getItem (cards, position) {
  return cards[position]
}
assert.strictEqual(getItem([1, 2, 4, 1], 2), 4)

// ----

function setItem (cards, position, replacementCard) {
  let newCards = [...cards]
  newCards.splice(position, 1, replacementCard)
  return newCards
}
assert.deepStrictEqual(setItem([1, 2, 4, 1], 2, 6), [1, 2, 6, 1])

// ----

function insertItemAtTop (cards, newCard) {
  cards.push(newCard)
  return cards
}
assert.deepStrictEqual(insertItemAtTop([5, 9, 7, 1], 8), [5, 9, 7, 1, 8])

// ----

function removeItem (cards, position) {
  let newCards = [...cards]
  newCards.splice(position, 1)
  return newCards
}
assert.deepStrictEqual(removeItem([3, 2, 6, 4, 8], 2), [3, 2, 4, 8])

// ----

function removeItemFromTop (cards) {
  let newCards = [...cards]
  newCards.pop()
  return newCards
}
assert.deepStrictEqual(removeItemFromTop([3, 2, 6, 4, 8]), [3, 2, 6, 4])

// ----

function insertItemAtBottom (cards, newCard) {
  cards.unshift(newCard)
  return cards
}
assert.deepStrictEqual(insertItemAtBottom([5, 9, 7, 1], 8), [8, 5, 9, 7, 1])

// ----

function removeItemAtBottom (cards) {
  let newCards = [...cards]
  newCards.shift()
  return newCards
}
assert.deepStrictEqual(removeItemAtBottom([8, 5, 9, 7, 1]), [5, 9, 7, 1])

// ----

function checkSizeOfStack (cards, stackSize) {
  return cards.length === stackSize
}
assert.deepStrictEqual(checkSizeOfStack([3, 2, 6, 4, 8], 4), false)
