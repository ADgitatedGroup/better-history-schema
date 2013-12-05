schema = require('../schema').site
Site = global.mongoose.model('Site', schema)

it_requires_field = (field) ->
  it "requires the #{field}", (done) ->
    delete @properties[field]
    site = new Site @properties
    site.validate (err) ->
      expect(err).toBeDefined()
      done()

describe "Site Schema", ->
  beforeEach ->
    @properties =
      title: 'awesome games'
      url: 'http://games.com'
      datetime: 123231232321313

  it "does not generate any errors when valid", (done) ->
    site = new Site @properties
    site.validate (err) ->
      expect(err).not.toBeDefined()
      done()

  describe "required fields", ->
    it_requires_field 'title'
    it_requires_field 'url'
    it_requires_field 'datetime'
