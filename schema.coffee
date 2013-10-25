mongoose = require('mongoose')

tag = mongoose.Schema
  name: String
  slug: String
  sites: [{
    url: String
    title: String
    datetime: String
    image: String
  }]

tag.path('name').validate (value) ->
  false unless value?
, 'missing tag name'

tag.path('sites').validate (value) ->
  false unless value?
, 'missing sites'

tag.path('slug').validate (value) ->
  false unless value?
, 'missing tag slug'

tag.path('name').validate (value) ->
  !/[\"\'\~\,\.\|\(\)\{\}\[\]\;\:\<\>\^\*\%\^]/.test(value)
, 'Invalid tag name'

exports.tag = tag
