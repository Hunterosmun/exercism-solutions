// Title: Mixed Juices

const assert = require('assert')

function timeToMixJuice (name) {
  switch (name) {
    case 'Pure Strawberry Joy':
      return 0.5
    case 'Energizer':
      return 1.5
    case 'Green Garden':
      return 1.5
    case 'Tropical Island':
      return 3
    case 'All or Nothing':
      return 5
    default:
      return 2.5
  }
}
assert.strictEqual(timeToMixJuice('Pure Strawberry Joy'), 0.5)
assert.strictEqual(timeToMixJuice('Tropical Island'), 3)
assert.strictEqual(timeToMixJuice('Berries & Lime'), 2.5)
assert.strictEqual(timeToMixJuice('Green Garden'), 1.5)

// ----

function limesToCut (wedgesNeeded, limes) {
  let wedgesCut = 0
  let timesCut = 0
  while (wedgesCut < wedgesNeeded) {
    switch (limes[0]) {
      case 'large':
        wedgesCut += 10
        timesCut += 1
        break
      case 'medium':
        wedgesCut += 8
        timesCut += 1
        break
      case 'small':
        wedgesCut += 6
        timesCut += 1
        break
      default:
        break
    }

    limes.shift()
    if (limes.length === 0) break
  }
  return timesCut
}
assert.strictEqual(
  limesToCut(25, ['small', 'small', 'large', 'medium', 'small']),
  4
)

// ----

function remainingOrders (timeLeft, orders) {
  while (timeLeft > 0) {
    timeLeft -= timeToMixJuice(orders[0])

    orders.shift()
    if (orders.length === 0) break
  }
  return orders
}
assert.deepStrictEqual(
  remainingOrders(5, ['Energizer', 'All or Nothing', 'Green Garden']),
  ['Green Garden']
)
