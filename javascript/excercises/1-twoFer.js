const assert = require('assert')

const twoFer = name =>
  name ? `One for ${name}, one for me.` : 'One for you, one for me.'

assert.strictEqual(twoFer(), 'One for you, one for me.')
assert.strictEqual(twoFer('Alice'), 'One for Alice, one for me.')
assert.strictEqual(twoFer('Bob'), 'One for Bob, one for me.')
