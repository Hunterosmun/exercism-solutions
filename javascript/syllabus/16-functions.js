// Title: Lasagna Master

const assert = require('assert')

function cookingStatus (time) {
  if (time === 0) return 'Lasagna is done.'
  if (!time) return 'You forgot to set the timer.'
  return 'Not done, please wait.'
}
assert.strictEqual(cookingStatus(12), 'Not done, please wait.')
assert.strictEqual(cookingStatus(), 'You forgot to set the timer.')

// ----

function preparationTime (layers, time = 2) {
  return layers.length * time
}
const layers = ['sauce', 'noodles', 'sauce', 'meat', 'mozzarella', 'noodles']
assert.strictEqual(preparationTime(layers, 3), 18)
assert.strictEqual(preparationTime(layers), 12)

// ----

function quantities (layers) {
  const amount = { noodles: 0, sauce: 0 }
  for (const layer of layers) {
    if (layer === 'noodles') amount.noodles = amount.noodles + 50
    if (layer === 'sauce') amount.sauce = amount.sauce + 0.2
  }
  return amount
}
assert.deepStrictEqual(
  quantities(['sauce', 'noodles', 'sauce', 'meat', 'mozzarella', 'noodles']),
  { noodles: 100, sauce: 0.4 }
)

// ----

function addSecretIngredient (friends, myList) {
  myList.push(friends[friends.length - 1])
}
const friendsList = ['noodles', 'sauce', 'mozzarella', 'kampot pepper']
const myList = ['noodles', 'meat', 'sauce', 'mozzarella']

assert.strictEqual(addSecretIngredient(friendsList, myList), undefined)

// console.log(myList)
// => ['noodles', 'meat', 'sauce', 'mozzarella', 'kampot pepper']

// ----

function scaleRecipe (recipe, portions) {
  const ingredients = {}
  for (let ing in recipe) {
    ingredients[ing] = (recipe[ing] * portions) / 2
  }
  return ingredients
}
const recipe = {
  noodles: 200,
  sauce: 0.5,
  mozzarella: 1,
  meat: 100
}

assert.deepStrictEqual(scaleRecipe(recipe, 4), {
  noodles: 400,
  sauce: 1,
  mozzarella: 2,
  meat: 200
})

// console.log(recipe)
// =>
// {
//   noodles: 200,
//   sauce: 0.5,
//   mozzarella: 1,
//   meat: 100,
// };
