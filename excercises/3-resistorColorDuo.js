const assert = require('assert')

//
// This is only a SKELETON file for the 'Resistor Color Duo' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

const decodedValue = arr => {
  const str = String(colors[arr[0]]) + colors[arr[1]]
  return +str
}

const colors = {
  black: 0,
  brown: 1,
  red: 2,
  orange: 3,
  yellow: 4,
  green: 5,
  blue: 6,
  violet: 7,
  grey: 8,
  white: 9
}

assert.strictEqual(decodedValue(['brown', 'black']), 10)
assert.strictEqual(decodedValue(['blue', 'grey']), 68)
assert.strictEqual(decodedValue(['yellow', 'violet']), 47)
assert.strictEqual(decodedValue(['orange', 'orange']), 33)
assert.strictEqual(decodedValue(['green', 'brown', 'orange']), 51)
