
{parseShort} = require 'cirru-parser'

astRead = (source) ->
  ast = parseShort source
  read ast[0]

read = (tree) ->
  if typeof tree is 'string'
    code = tree
    if code.match /^-?\d+(\.\d+)?$/
      return Number code
    else
      return code

  func = tree[0]
  args = tree[1..]

  switch func
    when 'map', '{}'
      ret = {}
      args.forEach (pair) ->
        key = pair[0]
        value = read pair[1]
        ret[key] = value
      ret
    when 'array', '[]'
      ret = []
      args.forEach (item) ->
        ret.push (read item)
      ret
    when 'string', "''"
      ret = args[0] or ''
      ret
    else throw new Error "(#{func}) is invalid"

exports.parse = astRead