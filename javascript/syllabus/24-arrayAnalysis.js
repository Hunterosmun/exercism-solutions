// Title: Elyses Analytic Enchantments

const assert = require('assert')

function getCardPosition (stack, card) {
  return stack.indexOf(card)
}
assert.strictEqual(getCardPosition([9, 7, 3, 2], 2), 3)

// ----

function doesStackIncludeCard (stack, card) {
  return stack.includes(card)
}
assert.strictEqual(doesStackIncludeCard([2, 3, 4, 5], 3), true)

// ----

function isEachCardEven (stack) {
  return stack.every(card => card % 2 === 0)
}
assert.strictEqual(isEachCardEven([2, 4, 6, 7]), false)

// ----

function doesStackIncludeOddCard (stack) {
  return stack.some(card => card % 2 !== 0)
}
assert.strictEqual(doesStackIncludeOddCard([3, 2, 6, 4, 8]), true)

// ----

function getFirstOddCard (stack) {
  return stack.find(card => card % 2 !== 0)
}
assert.strictEqual(getFirstOddCard([4, 2, 8, 7, 9]), 7)

// ----

function getFirstEvenCardPosition (stack) {
  return stack.findIndex(card => card % 2 === 0)
}
assert.strictEqual(getFirstEvenCardPosition([5, 2, 3, 1]), 1)
