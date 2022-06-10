// Title: Windowing System

const assert = require('assert')

function Size (width = 80, height = 60) {
  this.width = width
  this.height = height
}
Size.prototype.resize = function (
  newWidth = this.width,
  newHeight = this.height
) {
  this.width = newWidth
  this.height = newHeight
}
const size = new Size(1080, 764)
assert.strictEqual(size.width, 1080)
assert.strictEqual(size.height, 764)

size.resize(1920, 1080)
assert.strictEqual(size.width, 1920)
assert.strictEqual(size.height, 1080)

// ----

function Position (x = 0, y = 0) {
  this.x = x
  this.y = y
}
Position.prototype.move = function (newX = this.x, newY = this.y) {
  this.x = newX
  this.y = newY
}
const point = new Position()
assert.strictEqual(point.x, 0)
assert.strictEqual(point.y, 0)
point.move(100, 200)
assert.strictEqual(point.x, 100)
assert.strictEqual(point.y, 200)

// ----

class ProgramWindow {
  constructor () {
    this.screenSize = new Size(800, 600)
    this.size = new Size()
    this.position = new Position()
  }

  resize (newSize) {
    if (newSize.width < 1) newSize.width = 1
    if (newSize.height < 1) newSize.height = 1
    if (newSize.height + this.size.height > this.screenSize.height) {
      newSize.height = this.screenSize.height - this.position.y
    }
    if (newSize.width + this.size.width > this.screenSize.width) {
      newSize.width = this.screenSize.width - this.position.x
    }
    this.size = newSize
  }

  move (newPosition) {
    if (newPosition.x < 0) newPosition.x = 0
    if (newPosition.y < 0) newPosition.y = 0
    if (newPosition.y + this.size.height > this.screenSize.height) {
      newPosition.y = this.screenSize.height - this.size.height
    }
    if (newPosition.x + this.size.width > this.screenSize.width) {
      newPosition.x = this.screenSize.width - this.size.width
    }

    this.position = newPosition
  }
}
const programWindow = new ProgramWindow()
assert.strictEqual(programWindow.screenSize.width, 800)

// ----

const newSize = new Size(600, 400)
programWindow.resize(newSize)
assert.strictEqual(programWindow.size.width, 600)
assert.strictEqual(programWindow.size.height, 400)

// ----

const newPosition = new Position(50, 100)
programWindow.move(newPosition)
assert.strictEqual(programWindow.position.x, 50)
assert.strictEqual(programWindow.position.y, 100)

// ----

function changeWindow (programWindow) {
  const size = new Size(400, 300)
  programWindow.resize(size)
  const spot = new Position(100, 150)
  programWindow.move(spot)
  return programWindow
}

changeWindow(programWindow)
assert.strictEqual(programWindow.size.width, 400)
