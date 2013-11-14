mongoose = require('mongoose')
uniqueValidator = require('mongoose-unique-validator')

site = mongoose.Schema
  url:
    type: String
    required: true
  title:
    type: String
    required: true
  datetime:
    type: String
  image:
    type: String

tag = mongoose.Schema
  name:
    type: String
    required: true
    unique: true
  sites: [site]

user = mongoose.Schema
  subId:
    type: String
    required: true
    unique: true
  authId:
    type: String
    required: true
  avatar:
    type: String
  email:
    type: String
    required: true
  firstName:
    type: String
    required: true
  lastName:
    type: String
    required: true
  purchased:
    type: Boolean
    required: true
  tags: [tag]

tag.path('sites').validate (value) ->
  false unless value?
, 'missing sites'

tag.path('name').validate (value) ->
  !/[\"\'\~\,\.\|\(\)\{\}\[\]\;\:\<\>\^\*\%\^]/.test(value)
, 'Invalid tag name'

tag.plugin(uniqueValidator)
user.plugin(uniqueValidator)

exports.tag = tag
exports.user = user
exports.site = site
