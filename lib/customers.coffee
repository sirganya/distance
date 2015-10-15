# Customers Module
# ----------------
# Aync call to retrive a customer list

https = require('https');

options =
  host: 'gist.githubusercontent.com',
  path: '/brianw/19896c50afa89ad4dec3/raw/6c11047887a03483c50017c1d451667fd62a53ca/gistfile1.txt',
  method: 'GET'

data = null

#takes the text file and converts it to objects.
parse = (data)->

  parsed = data.match(/[^\r\n]+/g);
  customerObjs = []
  customerObjs.push JSON.parse(item) for item in parsed
  return customerObjs

class Customers
  constructor: (@name) ->

  # the intial callback is passed into this function.
  # If it was a character in Inception time would be running at 4000 times slower.
  # @params {object} cb
  # @params {object} initialCb
  get: (cb, initialCb)->

    if data
      cb(null, data)
    else
      callback = (response) ->
        data = '';
        response.on('data', (chunk) ->
          data += chunk
        )
        response.on('end', ->
          cb(parse(data), initialCb)
        )
      req = https.request(options, callback)
      req.end()


module.exports = Customers