class Todo.Routers.Items extends Backbone.Router
  routes:
    '' : 'index'
    'items/:id' : 'show'

  initialize: ->
    @collection = new Todo.Collections.Items()
    @collection.fetch()

  index: ->
    view = new Todo.Views.ItemsIndex(collection: @collection)
    $("#todoapp").html(view.render().el)

  show : (id) ->
    alert "#{id}"
