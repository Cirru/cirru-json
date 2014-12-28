
Cirru JSON
------

Converter between Cirru and JSON.

### Usage

Installation:

```
npm install --save cirru-json
```

Grammar of config files:

* Numbers: matched by `/^-?\d+(\.\d+)?$/`
* Strings: `:str` or `":string with spaces"`
* Arrays: `(array 1 (string 1))`, `([] 1 2)`
* Maps: `(map (:a 1))`
* Null: `#null`
* Function: `#lambda`
* Boolean: `#true`, `#false`
* Undefined: `#undefined`

Read about Cirru interpreter for more:
https://github.com/Cirru/interpreter#compact-literal-syntax

Demo:

```cirru
map
  :number 1
  :string :2
  :null #null
  :bool #false
  :lambda #lambda

  :array $ array 1 2 3
  :mixed-arrat $ array 1 :2 3

  :empty-map $ map
  :map $ map (:a 1)
  :map2 $ map $ :a 2
  :nested-map $ map
    :a $ array 1 2 3
    :b $ map (:a 2) (:b 3)
```

Use in CoffeeScript(Shelljs is not required, but better for demo):

```coffee
require 'shelljs/global'
cirruCode = cat 'config.cirru'

{parse, generate} = require 'cirru-json'
# this is parser
jsonData = parse cirruCode
# this os generator
convertBack = generate jsonData
```

### Develop and test

```bash
node-dev test.coffee
```

### License

MIT