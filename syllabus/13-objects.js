// Title: High Score Board

const assert = require('assert')

function createScoreBoard () {
  return { 'The Best Ever': 1000000 }
}
assert.deepStrictEqual(createScoreBoard(), { 'The Best Ever': 1000000 })

// ----

function addPlayer (scoreBoard, player, score) {
  scoreBoard[player] = score
  return scoreBoard
}
assert.deepStrictEqual(addPlayer({ 'Dave Thomas': 0 }, 'José Valim', 486373), {
  'Dave Thomas': 0,
  'José Valim': 486373
})

// ----

function removePlayer (scoreBoard, player) {
  delete scoreBoard[player]
  return scoreBoard
}
assert.deepStrictEqual(removePlayer({ 'Dave Thomas': 0 }, 'Dave Thomas'), {})
assert.deepStrictEqual(removePlayer({ 'Dave Thomas': 0 }, 'Rose Fanaras'), {
  'Dave Thomas': 0
})

// ----

function updateScore (scoreBoard, player, points) {
  scoreBoard[player] = scoreBoard[player] + points
  return scoreBoard
}
assert.deepStrictEqual(
  updateScore({ 'Freyja Ćirić': 12771008 }, 'Freyja Ćirić', 73),
  { 'Freyja Ćirić': 12771081 }
)

// ----

function applyMondayBonus (scoreBoard) {
  for (let player in scoreBoard) {
    scoreBoard[player] = scoreBoard[player] + 100
  }
  return scoreBoard
}
assert.deepStrictEqual(
  applyMondayBonus({
    'Dave Thomas': 44,
    'Freyja Ćirić': 539,
    'José Valim': 265
  }),
  {
    'Dave Thomas': 144,
    'Freyja Ćirić': 639,
    'José Valim': 365
  }
)

// ----

function normalizeScore (params) {
  return params.normalizeFunction(params.score)
}
assert.strictEqual(
  normalizeScore({ score: 400, normalizeFunction: s => 2 * s + 10 }),
  810
)
