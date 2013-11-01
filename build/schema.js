// Generated by CoffeeScript 1.6.1
(function() {
  var mongoose, tag, user;

  mongoose = require('mongoose');

  user = mongoose.Schema({
    authId: {
      type: String,
      required: true
    },
    tags: [
      {
        name: {
          type: String,
          required: true
        },
        sites: [
          {
            url: {
              type: String,
              required: true
            },
            title: {
              type: String,
              required: true
            },
            datetime: {
              type: String
            },
            image: {
              type: String
            }
          }
        ]
      }
    ]
  });

  tag = mongoose.Schema({
    name: {
      type: String,
      required: true
    },
    slug: {
      type: String,
      required: true
    },
    sites: [
      {
        url: {
          type: String,
          required: true
        },
        title: {
          type: String,
          required: true
        },
        datetime: {
          type: String
        },
        image: {
          type: String
        }
      }
    ]
  });

  tag.path('sites').validate(function(value) {
    if (value == null) {
      return false;
    }
  }, 'missing sites');

  tag.path('name').validate(function(value) {
    return !/[\"\'\~\,\.\|\(\)\{\}\[\]\;\:\<\>\^\*\%\^]/.test(value);
  }, 'Invalid tag name');

  exports.tag = tag;

  exports.user = user;

}).call(this);
