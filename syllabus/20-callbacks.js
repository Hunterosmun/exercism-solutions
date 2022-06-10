// Title: Fruit Picker

const assert = require('assert')

import { checkStatus, checkInventory } from './grocer'
//yeah... I don't have access to this file...

function isServiceOnline () {
  const s = {}
  checkStatus(status => (s.stat = status))
  return s.stat === 'ONLINE' ? true : false
}
assert.strictEqual(isServiceOnline(), true) // or false

// ----

function pickFruit (variety, quantity, callback) {
  const query = { variety, quantity }
  return checkInventory(query, callback)
}
// hard to check cause this is just a callback setup?

// ----

function purchaseInventoryIfAvailable (err, isAvailable) {
  if (err !== null) throw new Error('Server Offline')
  return isAvailable ? 'PURCHASE' : 'NOOP'
}
assert.strictEqual(
  purchaseInventoryIfAvailable('Server Offline', undefined),
  /*Throws new error*/ 'Server Offline'
)
assert.strictEqual(purchaseInventoryIfAvailable(null, true), 'PURCHASE')
assert.strictEqual(purchaseInventoryIfAvailable(null, false), 'NOOP')

// ----

function pickAndPurchaseFruit (variety, quantity) {
  return pickFruit(variety, quantity, purchaseInventoryIfAvailable)
}
