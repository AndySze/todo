window.Todo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Todo.Routers.Items()
    Backbone.history.start()

$(document).ready ->
  Todo.initialize()
