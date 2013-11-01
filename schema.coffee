mongoose = require('mongoose')

user = mongoose.Schema
  authId:
    type: String
    required: true
  tags: [
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
  ]

tag = mongoose.Schema
  name:
    type: String
    required: true
  slug:
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
