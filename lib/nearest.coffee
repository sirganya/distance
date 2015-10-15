# Nearest Module
# --------------
# This module gets the list of customers from the cutomers module and passes them into
# the Distances module returning the customers within a 100km radius of the reference point sorted ascending.

Customers = require('./customers')
Distances = require('./distances')

customers = new Customers
distances = new Distances

REFPOINT = {long: -6.2592576, lat:53.3381985}
DISTANCE = 10000 #meters

class Nearest

  constructor: (@name) ->

  # The first callback, passed in here from the outside.
  # @params {Object} cb
  init: (cb)->
    # getData is another callback, passed into the Cuetomers module
    # and  fired when the customer list is fetched asynchronously
    customers.get(getData, cb)

  # is there a better way to test private functions in a coffeescript class?
  testSort: (testData)->
    return testData.sort(numericalSortAsc)


# Private
# -------
# @params [user_data] data
# @params {Object} cb
getData = (data, cb)->
  nearest = getNearest(data)
  cb(nearest)

# @params [User_data] data
# @params {Object} cb
getNearest = (data)->

  results = distances.calculate(data, REFPOINT)
  results = results.sort(numericalSortAsc)
  withinDistance = []

  withinDistance.push user for user in results when user.dist <= 100000

  return withinDistance


numericalSortAsc = (a,b)->
  return a.user_id - b.user_id


module.exports = Nearest






