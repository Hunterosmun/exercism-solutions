const assert = require('assert')

function translate (letter) {
  const all = letter.split('')
  const cipher = { G: 'C', C: 'G', T: 'A', A: 'U' }
  return all.map(l => cipher[l]).join('')
}

assert.strictEqual(translate(''), '')
assert.strictEqual(translate('C'), 'G')
assert.strictEqual(translate('G'), 'C')
assert.strictEqual(translate('T'), 'A')
assert.strictEqual(translate('A'), 'U')
assert.strictEqual(translate('ACGTGGTCTTAA'), 'UGCACCAGAAUU')
