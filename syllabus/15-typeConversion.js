// Title: Lucky Numbers

const assert = require('assert')

function twoSum (array1, array2) {
  let arr1 = array1.reduce((acc, el) => {
    return acc + String(el)
  }, '')
  let arr2 = array2.reduce((acc, el) => {
    return acc + String(el)
  }, '')
  return +arr1 + +arr2
}
assert.strictEqual(twoSum([1, 2, 3], [0, 7]), 130)
// [1, 2, 3] represents 123 and [0, 7] represents 7.
// 123 + 7 = 130

// ----

function luckyNumber (value) {
  let sVal = String(value)
  while (sVal.length > 1) {
    if (sVal[0] !== sVal[sVal.length - 1]) return false
    sVal = sVal.substring(1, sVal.length - 1)
  }
  return true
}
assert.strictEqual(luckyNumber(1441), true)
assert.strictEqual(luckyNumber(123), false)

// ----

function errorMessage (input) {
  if (!input) return 'Required field'
  if (!Number(input) || Number(input) === 0) return 'Must be a number besides 0'
  return ''
}
assert.strictEqual(errorMessage('123'), '')
assert.strictEqual(errorMessage(''), 'Required field')
assert.strictEqual(errorMessage('abc'), 'Must be a number besides 0')
