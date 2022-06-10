// Title: Vehicle Purchase

const assert = require('assert')

function needsLicense (kind) {
  if (kind === 'car' || kind === 'truck') return true
  return false
}
assert.strictEqual(needsLicense('car'), true)
assert.strictEqual(needsLicense('bike'), false)

// ----

function chooseVehicle (option1, option2) {
  let sorted = [option1, option2].sort()
  return `${sorted[0]} is clearly the better choice.`
}
assert.strictEqual(
  chooseVehicle('Wuling Hongguang', 'Toyota Corolla'),
  'Toyota Corolla is clearly the better choice.'
)
assert.strictEqual(
  chooseVehicle('Volkswagen Beetle', 'Volkswagen Golf'),
  'Volkswagen Beetle is clearly the better choice.'
)

// ----

function calculateResellPrice (originalPrice, age) {
  if (age > 10) {
    return originalPrice * 0.5
  } else if (age >= 3) {
    return originalPrice * 0.7
  } else {
    return originalPrice * 0.8
  }
}
assert.strictEqual(calculateResellPrice(1000, 1), 800)
assert.strictEqual(calculateResellPrice(1000, 5), 700)
assert.strictEqual(calculateResellPrice(1000, 15), 500)
