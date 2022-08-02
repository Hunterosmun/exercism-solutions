// Title: Elyses Looping Enchantments

const assert = require('assert')

function cardTypeCheck (stack, card) {
  let count = 0
  stack.forEach(c => {
    if (c === card) count += 1
  })
  return count
}
const cardType = 3
assert.strictEqual(cardTypeCheck([1, 2, 3, 4], cardType), 1)

// ----

function determineOddEvenCards (stack, type) {
  let count = 0
  for (const card of stack) {
    if ((card % 2 === 0) === type) count += 1
  }
  return count
}
assert.strictEqual(determineOddEvenCards([1, 2, 3, 1, 5, 6], true), 2)
assert.strictEqual(determineOddEvenCards([1, 2, 3, 1, 5, 6], false), 4)
