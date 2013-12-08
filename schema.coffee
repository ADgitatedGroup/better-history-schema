mongoose = require('mongoose')
Schema = mongoose.Schema

event = new Schema
  url:
    type: String
    required: true
  statusCode:
    type: Number
    required: true
  data: {}
  createdAt:
    type: Date
    required: true
  method:
    type: String
    required: true
  ip:
    type: String
    required: true
  _user:
    type: mongoose.Schema.Types.ObjectId
    ref: 'User'

tag = new Schema
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
  _creator:
    type: Schema.Types.ObjectId
    ref: 'User'

site = new Schema
  _creator:
    type: Schema.Types.ObjectId
    ref: 'User'
  url:
    type: String
    required: true
  title:
    type: String
    required: true
  datetime:
    type: String
    required: true
  image:
    type: String
  tags: [String]

user = new Schema
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
  purchasedAt:
    type: String
  createdAt:
    type: String
    required: true

tag.path('sites').validate (value) ->
  false unless value?
, 'missing sites'

tag.path('name').validate (value) ->
  !/[\"\'\~\,\.\|\(\)\{\}\[\]\;\:\<\>\^\*\%\^]/.test(value)
, 'Invalid tag name'

exports.tag = tag
exports.user = user
exports.site = site
exports.event = event
