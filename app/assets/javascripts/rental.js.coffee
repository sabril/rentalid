window.Rental =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Rental.Routers.Home()
    Backbone.history.start()

$(document).ready ->
  Rental.init()
