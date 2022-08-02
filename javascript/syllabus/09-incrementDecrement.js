// Title: Bird Watcher

const assert = require('assert')

function totalBirdCount (birdsPerDay) {
  let totalBirds = 0
  for (let i = 0; i < birdsPerDay.length; i++) {
    totalBirds += birdsPerDay[i]
  }
  return totalBirds
}
assert.strictEqual(
  totalBirdCount([2, 5, 0, 7, 4, 1, 3, 0, 2, 5, 0, 1, 3, 1]),
  34
)

// ----

function birdsInWeek (birdsPerDay, week) {
  let newList = [...birdsPerDay]
  newList.splice(week * 7)
  newList.splice(0, newList.length - 7)

  return totalBirdCount(newList)
}
assert.strictEqual(
  birdsInWeek([2, 5, 0, 7, 4, 1, 3, 0, 2, 5, 0, 1, 3, 1], 2),
  12
)

// ----

function fixBirdCountLog (birdsPerDay) {
  for (let i = 0; i < birdsPerDay.length; ++i) {
    if (i % 2) birdsPerDay[i] = birdsPerDay[i]
    else birdsPerDay[i] = birdsPerDay[i] + 1
  }
  return birdsPerDay
}
assert.deepStrictEqual(fixBirdCountLog([2, 5, 0, 7, 4, 1]), [3, 5, 1, 7, 5, 1])
