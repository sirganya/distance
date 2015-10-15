Distances = require '../lib/distances.coffee'
should = require 'should'

describe 'Distances', ->
  it 'should calculate zero distance between the same point', ->
    distances = new Distances
    data = {lat: 0, long: 0}
    refPoint = {lat:0, long: 0}
    dist = distances.calculate(data, refPoint)
    dist.should.equal(0)

  it 'should calculate the correct distance between two points', ->
    distances = new Distances
    data = {lat: 0, long: 0}
    refPoint = {lat:1, long: 1}
    dist = distances.calculate(data, refPoint)
    dist.should.equal(157249.38127194397)





