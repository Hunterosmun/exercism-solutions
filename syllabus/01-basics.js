// Title: Lucians Lucious Lasagna

const assert = require('assert')

const PREPARATION_MINUTES_PER_LAYER = 2
const EXPECTED_MINUTES_IN_OVEN = 40
assert.strictEqual(EXPECTED_MINUTES_IN_OVEN, 40)

// ----

function remainingMinutesInOven (actualMinutesInOven) {
  const TIME_LEFT = EXPECTED_MINUTES_IN_OVEN - actualMinutesInOven
  // if(TIME_LEFT < 0) return 0
  return TIME_LEFT
}
assert.strictEqual(remainingMinutesInOven(30), 10)

// ----

function preparationTimeInMinutes (numberOfLayers) {
  return numberOfLayers * PREPARATION_MINUTES_PER_LAYER
}
assert.strictEqual(preparationTimeInMinutes(2), 4)

// ----

function totalTimeInMinutes (numberOfLayers, actualMinutesInOven) {
  const PREP_TIME = preparationTimeInMinutes(numberOfLayers)
  return PREP_TIME + actualMinutesInOven
}
assert.strictEqual(totalTimeInMinutes(3, 20), 26)
