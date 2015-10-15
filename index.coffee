## Nearest and Dearest
## -------------------
## This uses callbacks to grab a list of user locations
## and sort them into to the closest user to a reference point
## I wanted to keep it as free from dependencies as possible, avoiding promise libs etc.

Nearest = require('./lib/nearest')

nearest = new Nearest

##this call back function should contain code to do something more interesting with the result
cb = (res)->
  console.log res

#@params {Object} cb
nearest.init(cb)

