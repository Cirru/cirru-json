
require 'shelljs/global'
{parse} = require './coffee/parser'
{generate} = require './coffee/generator'

stringify = (x) ->
  JSON.stringify x, null, 2

source = cat 'cirru/source.cirru'
json = parse source

(stringify json).to 'cirru/target.json'

cirruCode = generate json
cirruCode.to 'cirru/generated.cirru'

(stringify (parse cirruCode)).to 'cirru/confirm.json'