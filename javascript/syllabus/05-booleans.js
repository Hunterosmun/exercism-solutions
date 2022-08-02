// Title: Annalyn's Infiltration

const assert = require('assert')

function canExecuteFastAttack (knightIsAwake) {
  return knightIsAwake ? false : true
}
assert.strictEqual(canExecuteFastAttack(true), false)

// ----

function canSpy (knightIsAwake, archerIsAwake, prisonerIsAwake) {
  if (knightIsAwake || archerIsAwake || prisonerIsAwake) return true
  return false
}
assert.strictEqual(canSpy(false, true, false), true)

// ----

function canSignalPrisoner (archerIsAwake, prisonerIsAwake) {
  if (prisonerIsAwake && !archerIsAwake) return true
  return false
}
assert.strictEqual(canSignalPrisoner(false, true), true)

// ----

function canFreePrisoner (
  knightIsAwake,
  archerIsAwake,
  prisonerIsAwake,
  petDogIsPresent
) {
  if (petDogIsPresent) {
    if (!archerIsAwake) return true
    return false
  } else {
    if (prisonerIsAwake && !knightIsAwake && !archerIsAwake) return true
    return false
  }
}
assert.strictEqual(canFreePrisoner(false, true, false, false), false)
