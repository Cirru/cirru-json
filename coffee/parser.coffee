
{parseShort} = require 'cirru-parser'

astRead = (source) ->
  ast = parseShort source
  read ast[0]

read = (tree) ->
  if typeof tree is 'string'
    code = tree
    if code.match /^-?\d+(\.\d+)?$/
      return Number code
    else if code[0] is ':'
      return code[1..]

  func = tree[0]
  args = tree[1..]

  switch func
    when 'map'
      ret = {}
      args.forEach (pair) ->
        key = pair[0][1..]
        value = read pair[1]
        ret[key] = value
      ret
    when 'array'
      ret = []
      args.forEach (item) ->
        ret.push (read item)
      ret
    else throw new Error "(#{func}) is invalid"

exports.parse = astRead