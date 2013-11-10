schema = require('../schema').user
User = global.mongoose.model('User', schema)

describe "User Schema", ->
  beforeEach ->
    properties =
      authId: '2314124234'
      sessionId: '456456456'
      email: 'user@gmail.com'
      firstName: 'Bill'
      lastName: 'Smith'

    @user = new User properties

  it "does not generate any errors when valid", (done) ->
    @user.validate (err) ->
      expect(err).not.toBeDefined()
      done()

