mongoose = require('mongoose')

user = mongoose.Schema
  subId:
    type: String
    required: true
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
  tags: [{
    type: mongoose.Schema.Types.ObjectId
    ref: 'Tag'
  }]

tag = mongoose.Schema
  name:
    type: String
    required: true
  sites: [{
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
  }]

tag.path('sites').validate (value) ->
  false unless value?
, 'missing sites'

tag.path('name').validate (value) ->
  !/[\"\'\~\,\.\|\(\)\{\}\[\]\;\:\<\>\^\*\%\^]/.test(value)
, 'Invalid tag name'

exports.tag = tag
exports.user = user
