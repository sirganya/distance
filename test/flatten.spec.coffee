FlattenArray = require '../lib/flatten.coffee'
should = require 'should'
flattenArray = new FlattenArray

describe 'This takes an array of arrays and flattens it', ->
  it 'should flatten an array',->
    arr =[[1,2,[3]],4]
    flattenArray.flatten(arr).should.deepEqual([1,2,3,4])