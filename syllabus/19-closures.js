// Title: Coordinate Transformation

const assert = require('assert')

function translate2d (dx, dy) {
  return (x, y) => {
    return [x + dx, y + dy]
  }
}
const moveCoordinatesRight2Px = translate2d(2, 0)
const result = moveCoordinatesRight2Px(4, 8)
assert.deepStrictEqual(result, [6, 8])

// ----

function scale2d (sx, sy) {
  return (x, y) => {
    return [x * sx, y * sy]
  }
}
const doubleScale = scale2d(2, 2)
const result2 = doubleScale(6, -3)
assert.deepStrictEqual(result2, [12, -6])

// ----

function composeTransform (f, g) {
  return (x, y) => {
    let [a, b] = f(x, y)
    let [c, d] = g(a, b)
    return [c, d]
  }
}
const moveCoordinatesRight2Px2 = translate2d(2, 0)
const doubleCoordinates = scale2d(2, 2)
const composedTransformations = composeTransform(
  moveCoordinatesRight2Px2,
  doubleCoordinates
)
const result3 = composedTransformations(0, 1)
assert.deepStrictEqual(result3, [4, 2])

// ----

function memoizeTransform (f) {
  let memo = {}
  return (x, y) => {
    if (memo[`${x},${y}`]) return memo[`${x},${y}`]
    let newMemo = { [`${x},${y}`]: f(x, y) }
    memo = { ...newMemo }
    return memo[`${x},${y}`]
  }
}
const tripleScale = scale2d(3, 3)
const memoizedScale = memoizeTransform(tripleScale)

assert.deepStrictEqual(memoizedScale(4, 3), [12, 9]) // this is computed since it hasn't been computed before for the arguments
assert.deepStrictEqual(memoizedScale(4, 3), [12, 9]) // this is remembered, since it was computed already
