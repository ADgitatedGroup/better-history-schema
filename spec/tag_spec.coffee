schema = require('../schema').tag
Tag = global.mongoose.model('Tag', schema)

describe "Tag Schema", ->
  beforeEach ->
    properties =
      name: 'games'
      slug: 'games-1'
      sites: [{
        title: 'awesome games'
        url: 'http://games.com'
      }]

    @tag = new Tag properties

  it "does not generate any errors when valid", (done) ->
    @tag.validate (err) ->
      expect(err).not.toBeDefined()
      done()

  it "errors when the name is blank", (done) ->
    @tag.name = ''
    @tag.validate (err) ->
      expect(err.errors.name).toBeDefined()
      done()

  describe 'when name contains invalid characters', ->
    it "errors on name (1)", (done) ->
      @tag.name = 'games['
      @tag.validate (err) ->
        expect(err.errors.name).toBeDefined()
        done()

    it "errors on name (2)", (done) ->
      @tag.name = 'games"'
      @tag.validate (err) ->
        expect(err.errors.name).toBeDefined()
        done()

    it "errors on name (3)", (done) ->
      @tag.name = 'games~'
      @tag.validate (err) ->
        expect(err.errors.name).toBeDefined()
        done()

    it "errors on name (4)", (done) ->
      @tag.name = 'g;ames'
      @tag.validate (err) ->
        expect(err.errors.name).toBeDefined()
        done()

    it "errors on name (5)", (done) ->
      @tag.name = 'game%s'
      @tag.validate (err) ->
        expect(err.errors.name).toBeDefined()
        done()

    it "errors on name (6)", (done) ->
      @tag.name = '^games'
      @tag.validate (err) ->
        expect(err.errors.name).toBeDefined()
        done()

  it "errors when the slug is blank", (done) ->
    @tag.slug = ''
    @tag.validate (err) ->
      expect(err.errors.slug).toBeDefined()
      done()

  it "errors when the sites are null", (done) ->
    @tag.sites = null
    @tag.validate (err) ->
      expect(err.errors.sites).toBeDefined()
      done()

  describe "sites", ->
    it "errors when a site url is empty", (done) ->
      @tag.sites[0].url = ''
      @tag.validate (err) ->
        expect(err.errors['sites.0.url']).toBeDefined()
        done()

    it "errors when a site title is empty", (done) ->
      @tag.sites[0].title = ''
      @tag.validate (err) ->
        expect(err.errors['sites.0.title']).toBeDefined()
        done()
