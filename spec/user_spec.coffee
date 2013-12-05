schema = require('../schema').user
User = global.mongoose.model('User', schema)

it_requires_field = (field) ->
  it "requires the #{field}", (done) ->
    delete @properties[field]
    user = new User @properties
    user.validate (err) ->
      expect(err).toBeDefined()
      done()

describe "User Schema", ->
  beforeEach ->
    @properties =
      authId: '2314124234'
      subId: '456456456'
      email: 'user@gmail.com'
      firstName: 'Bill'
      lastName: 'Smith'
      purchased: false
      createdAt: new Date().toString()

  it "does not generate any errors when valid", (done) ->
    user = new User @properties
    user.validate (err) ->
      expect(err).not.toBeDefined()
      done()

  describe 'required fields', ->
    it_requires_field 'subId'
    it_requires_field 'authId'
    it_requires_field 'email'
    it_requires_field 'firstName'
    it_requires_field 'lastName'
    it_requires_field 'purchased'
    it_requires_field 'createdAt'
