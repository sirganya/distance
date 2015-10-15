Nearest = require '../lib/nearest.coffee'
should = require 'should'

describe 'Test Nearest', ->
  nearest = new Nearest
  it 'should sort numerically', ->
    testUsers = [{user_id: 7}, {user_id: 3}, {user_id:45}]

    nearest.testSort(testUsers).should.deepEqual([ { user_id: 3 }, { user_id: 7 }, { user_id: 45 } ])