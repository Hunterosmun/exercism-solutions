// Title: Ozan's Playlist

const assert = require('assert')

function removeDuplicates (playlist) {
  const list = new Set()
  playlist.forEach(el => list.add(el))
  return [...list]
}
const playlist = [
  'Court and Spark - Joni Mitchell',
  'Big Yellow Taxi - Joni Mitchell',
  'Court and Spark - Joni Mitchell'
]
assert.deepStrictEqual(removeDuplicates(playlist), [
  'Court and Spark - Joni Mitchell',
  'Big Yellow Taxi - Joni Mitchell'
])

// ----

function hasTrack (playlist, track) {
  return playlist.includes(track)
}
const playlist2 = [
  'The Fashion Show - Grace Jones',
  'Dr. Funkenstein - Parliament'
]
assert.strictEqual(hasTrack(playlist2, 'Dr. Funkenstein - Parliament'), true)
assert.strictEqual(
  hasTrack(playlist2, 'Walking in the Rain - Grace Jones'),
  false
)

// ----

function addTrack (playlist, track) {
  const list = new Set()
  playlist.forEach(el => list.add(el))
  list.add(track)
  return [...list]
}
const playlist3 = ['Selma - Bijelo Dugme']
assert.deepStrictEqual(addTrack(playlist3, 'Atomic Dog - George Clinton'), [
  'Selma - Bijelo Dugme',
  'Atomic Dog - George Clinton'
])
assert.deepStrictEqual(addTrack(playlist3, 'Selma - Bijelo Dugme'), [
  'Selma - Bijelo Dugme',
  'Atomic Dog - George Clinton'
])

// ----

function deleteTrack (playlist, track) {
  const list = new Set()
  playlist.forEach(el => list.add(el))
  list.delete(track)
  return [...list]
}
const playlist4 = [
  'The Treasure - Fra Lippo Lippi',
  'After the Fall - Klaus Nomi'
]
assert.deepStrictEqual(
  deleteTrack(playlist4, 'The Treasure - Fra Lippo Lippi'),
  ['After the Fall - Klaus Nomi']
)
assert.deepStrictEqual(
  deleteTrack(playlist4, 'I Feel the Magic - Belinda Carlisle'),
  ['After the Fall - Klaus Nomi']
)

// ----

function listArtists (playlist) {
  const list = new Set()
  playlist.forEach(el => {
    let [song, artist] = el.split(' - ')
    list.add(artist)
  })
  return [...list]
}
const playlist5 = [
  'All Mine - Portishead',
  'Sight to Behold - Devendra Banhart',
  'Sour Times - Portishead'
]
assert.deepStrictEqual(listArtists(playlist5), [
  'Portishead',
  'Devendra Banhart'
])
