// Title: Freelancer Rates

const assert = require('assert')

function dayRate (ratePerHour) {
  return ratePerHour * 8
}
assert.strictEqual(dayRate(89), 712)

// ----

function daysInBudget (budget, ratePerHour) {
  return Math.floor(budget / dayRate(ratePerHour))
}
assert.strictEqual(daysInBudget(20000, 89), 28)

// ----

function priceWithMonthlyDiscount (ratePerHour, numDays, discount) {
  const numMonths = Math.floor(numDays / 22)
  const singleDayRate = dayRate(ratePerHour)
  const fullPrice = numDays * singleDayRate
  const monthRate = singleDayRate * 22
  const discountPrice = numMonths * (monthRate * discount)
  return Math.ceil(fullPrice - discountPrice)
}
assert.strictEqual(priceWithMonthlyDiscount(89, 230, 0.42), 97972)
