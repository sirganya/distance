Customers = require '../lib/customers.coffee'
should = require 'should'

describe 'Customer data', ->
  it 'should return an array of objects', (done)->
    customer = new Customers
    res = null
    customer.get((data)->
      res = data
      done()
      res.should.have.length(32)
      res.should.containEql({"latitude": "54.180238", "user_id": 17, "name": "Patricia Cahill", "longitude": "-5.920898"})
    )

