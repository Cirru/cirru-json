
{parseShort} = require 'cirru-parser'

astRead = (source) ->
  ast = parseShort source
  read ast[0]

read = (tree) ->
  if typeof tree is 'string'
    return null if tree is '#null'
    return null if tree is '#lambda' # dont throw errors
    return Number tree if tree.match /^-?\d+(\.\d+)?$/
    return tree[1..] if tree[0] is ':'

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