// Title: Custom Signs

const assert = require('assert')

function buildSign (occasion, name) {
  return `Happy ${occasion} ${name}!`
}
assert.strictEqual(buildSign('Birthday', 'Rob'), 'Happy Birthday Rob!')

// ----

function buildBirthdaySign (age) {
  return age >= 50
    ? 'Happy Birthday! What a mature fellow you are.'
    : 'Happy Birthday! What a young fellow you are.'
}
assert.strictEqual(
  buildBirthdaySign(45),
  'Happy Birthday! What a young fellow you are.'
)

// ---

function graduationFor (name, year) {
  return `Congratulations ${name}!\nClass of ${year}`
}
assert.strictEqual(
  graduationFor('Hannah', 2022),
  'Congratulations Hannah!\nClass of 2022'
)

// ----

function costOf (sign, currency) {
  return `Your sign costs ${20 + sign.length * 2}.00 ${currency}.`
}
assert.strictEqual(
  costOf('Happy Birthday Rob!', 'dollars'),
  'Your sign costs 58.00 dollars.'
)
