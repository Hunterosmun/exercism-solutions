// Title: Amusement Park

const assert = require('assert')

// ----

function createVisitor (name, age, ticketId) {
  return { name, age, ticketId }
}
assert.deepStrictEqual(createVisitor('Verena Nardi', 45, 'H32AZ123'), {
  name: 'Verena Nardi',
  age: 45,
  ticketId: 'H32AZ123'
})

// ----

function revokeTicket (visitor) {
  visitor.ticketId = null
  return visitor
}
const visitor = { name: 'Verena Nardi', age: 45, ticketId: 'H32AZ123' }
assert.deepStrictEqual(revokeTicket(visitor), {
  name: 'Verena Nardi',
  age: 45,
  ticketId: null
})

// ----

function ticketStatus (tickets, ticketId) {
  if (tickets[ticketId]) return `sold to ${tickets[ticketId]}`
  if (tickets[ticketId] === null) return 'not sold'
  return 'unknown ticket id'
}
const tickets = { '0H2AZ123': null, '23LA9T41': 'Verena Nardi' }
assert.strictEqual(ticketStatus(tickets, 'RE90VAW7'), 'unknown ticket id')
assert.strictEqual(ticketStatus(tickets, '0H2AZ123'), 'not sold')
assert.strictEqual(ticketStatus(tickets, '23LA9T41'), 'sold to Verena Nardi')

// ----

function simpleTicketStatus (tickets, ticketId) {
  if (tickets[ticketId] === null) return 'invalid ticket !!!'
  if (tickets[ticketId] === undefined) return 'invalid ticket !!!'
  return tickets[ticketId]
}
const tick2 = { '0H2AZ123': null, '23LA9T41': 'Verena Nardi' }
assert.strictEqual(simpleTicketStatus(tick2, '23LA9T41'), 'Verena Nardi')
assert.strictEqual(simpleTicketStatus(tick2, '0H2AZ123'), 'invalid ticket !!!')
assert.strictEqual(simpleTicketStatus(tick2, 'RE90VAW7'), 'invalid ticket !!!')

// ----

function gtcVersion (visitor) {
  if (visitor.gtc?.version) return visitor.gtc.version
  return undefined
}
const visitorNew = {
  name: 'Verena Nardi',
  age: 45,
  ticketId: 'H32AZ123',
  gtc: {
    signed: true,
    version: '2.1'
  }
}
const visitorOld = {
  name: 'Verena Nardi',
  age: 45,
  ticketId: 'H32AZ123'
}
assert.strictEqual(gtcVersion(visitorNew), '2.1')
assert.strictEqual(gtcVersion(visitorOld), undefined)
