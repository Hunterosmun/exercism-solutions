const assert = require('assert')
// A gigasecond is 10^9 (1,000,000,000) seconds.

const gigasecond = date => {
  return new Date(date.getTime() + 1_000_000_000_000)
}

const gs1 = gigasecond(new Date(Date.UTC(2011, 3, 25)))
const expectedDate1 = new Date(Date.parse('2043-01-01T01:46:40Z'))
assert.deepStrictEqual(gs1, expectedDate1)

const gs2 = gigasecond(new Date(Date.UTC(1977, 5, 13)))
const expectedDate2 = new Date(Date.parse('2009-02-19T01:46:40Z'))
assert.deepStrictEqual(gs2, expectedDate2)

const gs3 = gigasecond(new Date(Date.UTC(1959, 6, 19)))
const expectedDate3 = new Date(Date.parse('1991-03-27T01:46:40Z'))
assert.deepStrictEqual(gs3, expectedDate3)

const gs4 = gigasecond(new Date(Date.UTC(2015, 0, 24, 22, 0, 0)))
const expectedDate4 = new Date(Date.parse('2046-10-02T23:46:40Z'))
assert.deepStrictEqual(gs4, expectedDate4)

const gs5 = gigasecond(new Date(Date.UTC(2015, 0, 24, 23, 59, 59)))
const expectedDate5 = new Date(Date.parse('2046-10-03T01:46:39Z'))
assert.deepStrictEqual(gs5, expectedDate5)
