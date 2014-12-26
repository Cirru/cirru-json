
{pretty} = require 'cirru-writer'

type = (data) ->
  Object.prototype.toString.call(data)[8...-1]

makePairs = (data) ->
  [":#{key}", (gen value)] for key, value of data

gen = (data) ->
  switch (type data)
    when 'Null'     then '#null'
    when 'Function' then '#lambda' # special case
    when 'String'   then ":#{data}"
    when 'Number'   then data.toString()
    when 'Array'    then ['array'].concat data.map(gen)
    when 'Object'   then ['map'].concat makePairs(data)
    else throw new Error "(#{data}) is invalid"

exports.generate = (json) ->
  # console.log 'json:', JSON.stringify((gen json), null, 2)
  result = gen json
  if (type result) is 'String'
  then result
  else pretty [result]