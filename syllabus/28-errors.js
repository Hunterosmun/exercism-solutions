// Title: Factory Sensors

const assert = require('assert')

class ArgumentError extends Error {}

class OverheatingError extends Error {
  constructor (temperature) {
    super(`The temperature is ${temperature} ! Overheating !`)
    this.temperature = temperature
  }
}

// ----

function checkHumidityLevel (humidityPercentage) {
  if (humidityPercentage > 70) throw new Error('DANGER!! HOTDOGS ARE BURNIN!!')
}
//checkHumidityLevel(60); => undefined
//checkHumidityLevel(100); => Throws an error

// ----

function reportOverheating (temperature) {
  if (temperature === null) throw new ArgumentError()
  if (temperature > 500) throw new OverheatingError(temperature)
}

// ----

function monitorTheMachine (actions) {
  try {
    const status = actions.check()
  } catch (errs) {
    if (errs instanceof ArgumentError) actions.alertDeadSensor()
    else if (errs instanceof OverheatingError) {
      if (errs.temperature < 600) actions.alertOverheating()
      else actions.shutdown()
    } else throw errs
  }
}
