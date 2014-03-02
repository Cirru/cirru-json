
Cirru JSON
------

Converter between Cirru and JSON.

### Usage

Installation:

```
npm install --save cirru-json
```

Grammar of config files:

* Numbers: are matched by `/^-?\d+(\.\d+)?$/`, or `(number 1)`
* Strings: `(string "str ing")`, `('' "str ing")`
* Arrays: `(array 1 (string 1))`, `([] 1 2)`
* Maps: `(map (a 1))`, `({} (a 2))`

Demo:

```cirru
map
  a 1
  b "number 2"

  c $ '' 2
  c2 $ string 2

  d $ array 1 2 3
  d2 $ array
    , 1 2 3
  d3 $ [] 1 2 3
  d4 $ [] (string 1) 2

  e $ map
  e2 $ map (a 1)
  e3 $ map $ a 2
  e4 $ map
    a $ array 1 2 3
    b $ map (a 2) (b 3)
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