class Todo.Views.ItemsIndex extends Backbone.View

  template: JST['items/index']

  initialize: ->
    @collection.on('reset',@render,this)

  render: ->
    $(@el).html(@template(items: @collection))
    this
