class Rental.Routers.Home extends Backbone.Router
  routes:
    '': 'index'
    'plans': 'plans'
  
  index: ->
    view = new Rental.Views.HomeIndex()
    #$('#container').html(view.render().el)
  
  plans: ->
    alert "plan"