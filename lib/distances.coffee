# Distances Module
# ----------------
# Calculates the distance on the surface of a shere between two points
# The radius of this shpere is set to the radius at the equator to approximate distances on the Earth

# utility for Numbers
Number.prototype.toRadians = ->
  num = this
  return num * (Math.PI/180)

# calculates the distance between two points defined in degrees latitude and longitude.
# @param {Object} coordsA
# @param {Object} coordsB
# return distance in meters
vincentyFormula = (coordsA, coordsB ) ->

  φ1 = coordsA.lat.toRadians()
  φ2 = coordsB.lat.toRadians()
  λ1 = coordsA.long.toRadians()
  λ2 = coordsB.long.toRadians()
  Δφ = (φ1 - φ2)
  Δλ = (λ1 - λ2)

  a = (Math.cos(φ2) * Math.sin(Δλ))
  b = (Math.cos(φ1) * Math.sin(φ2)) - (Math.sin(φ1) * Math.cos(φ2) * Math.cos(Δλ))
  denom = (Math.sin(φ1) * Math.sin(φ2)) + (Math.cos(φ1) * Math.cos(φ2) * Math.cos(Δλ))

  equaRad = 6371000 #meters
  angle = Math.sqrt( (a*a) + (b*b) ) / denom
  greatAngle = Math.atan( angle)
  dist = equaRad * greatAngle

  return dist


# takes an array of loacation objects or a single location object and
# returns the distances between the points
class Distances

# @params {Object} [{Objects}] a single location or an array of locations
# @params {Object} refpoint
# return [distances]
  constructor: (@name) ->

  calculate: (data, refpoint) ->
    return vincentyFormula(data, refpoint) if !Array.isArray data

    distances = []

    for datum in data
      coordsA =
        long: parseFloat(datum.longitude)
        lat: parseFloat(datum.latitude)
      distances.push({dist: vincentyFormula(coordsA, refpoint), name: datum.name, user_id: datum.user_id})

    return distances


module.exports = Distances