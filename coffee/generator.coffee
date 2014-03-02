
{generate} = require 'cirru-writer'

isArray = (x) -> Array.isArray x
isString = (x) -> typeof x is 'string'
isNumber = (x) -> typeof x is 'number'
isMap = (x) ->
  if isArray x
    no
  else
    typeof x is 'object'

gen = (data) ->
  type = Object.prototype.toString.call data
  switch type
    when '[object String]'
      ret = ['string']
      ret.push data
      ret
    when '[object Array]'
      ret = ['array']
      data.forEach (x) ->
        ret.push (gen x)
      ret
    when '[object Number]'
      data.toString()
    when '[object Object]'
      ret = ['map']
      for key, value of data
        pair = []
        pair.push key
        pair.push (gen value)
        ret.push pair
      ret
    else throw new Error "(#{JSON.stringify data}) is invalid"

exports.generate = (json) ->
  # console.log 'json:', JSON.stringify((gen json), null, 2)
  generate [gen json]