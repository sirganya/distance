#Flatten Array
#Takes an array of arrays and flatten it
class FlattenArray

  constructor: (@name) ->

  #@params [array] arr
  flatten: (arr)->
    return algo(arr)

#private
algo = (arr)->
  result = arr.reduce( (prev,curr) ->
    if Array.isArray curr
      prev.concat algo curr
    else
      prev.concat curr
  ,[])
  return result

module.exports = FlattenArray

