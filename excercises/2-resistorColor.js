const assert = require('assert')

const colorCode = toFind => {
  return COLORS.findIndex(c => c === toFind)
}

const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white'
]

const col = {
  Black: 0,
  Brown: 1,
  Red: 2,
  Orange: 3,
  Yellow: 4,
  Green: 5,
  Blue: 6,
  Violet: 7,
  Grey: 8,
  White: 9
}

assert.strictEqual(colorCode('black'), 0)
assert.strictEqual(colorCode('white'), 9)
assert.strictEqual(colorCode('orange'), 3)
assert.deepStrictEqual(COLORS, [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white'
])
