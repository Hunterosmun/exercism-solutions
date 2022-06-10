// Title: Translation Services

const assert = require('assert')

class TranslationService {
  constructor (api) {
    this.api = api
  }

  free (text) {
    return this.api
      .fetch(text)
      .then(e => e.translation)
      .catch(err => {
        throw err
      })
  }

  batch (texts) {
    const res = texts.map(text => {
      return this.api
        .fetch(text)
        .then(e => e.translation)
        .catch(err => {
          throw err
        })
    })
    if (res.length === 0) throw new BatchIsEmpty()
    return res
  }

  request (text) {
    let res
    let error
    for (let i = 0; i < 2; i++) {
      this.free(text)
        .then(e => {
          res = e
        })
        .catch(err => {
          error = err
        })
    }
    return res ? res : error
  }

  premium (text, minimumQuality) {
    return this.api
      .fetch(text)
      .then(e => {
        if (e.quality < minimumQuality) throw new QualityThresholdNotMet(text)
        else return e
      })
      .catch(err => {
        throw new Error(err)
      })
      .finally(e => e)
  }
}

class QualityThresholdNotMet extends Error {
  constructor (text) {
    super(
      `
The translation of ${text} does not meet the requested quality threshold.
    `.trim()
    )

    this.text = text
  }
}

class BatchIsEmpty extends Error {
  constructor () {
    super(
      `
Requested a batch translation, but there are no texts in the batch.
    `.trim()
    )
  }
}
