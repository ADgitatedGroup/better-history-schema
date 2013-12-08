schema = require('../schema').event
Event = global.mongoose.model('Event', schema)

it_requires_field = (field) ->
  it "requires the #{field}", (done) ->
    delete @properties[field]
    event = new Event @properties
    event.validate (err) ->
      expect(err).toBeDefined()
      done()

describe "Event Schema", ->
  beforeEach ->
    @properties =
      ip: '127.0.0.1'
      statusCode: 200
      method: 'GET'
      url: '/user/tags'
      data: {}
      createdAt: new Date().toString()

  it "does not generate any errors when valid", (done) ->
    event = new Event @properties
    event.validate (err) ->
      expect(err).not.toBeDefined()
      done()

  describe 'required fields', ->
    it_requires_field 'ip'
    it_requires_field 'statusCode'
    it_requires_field 'url'
    it_requires_field 'createdAt'
    it_requires_field 'method'
