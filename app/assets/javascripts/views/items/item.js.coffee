class Todo.Views.Item extends Backbone.View

  template: JST['items/item']
  tagName: 'li'

  events:
    'dblclick .todo-text' : 'editItem'
    'click .todo-destroy': 'deleteItem'
    'change .check': 'updateState'
    'keypress .todo-input': 'updateItem'

  initialize: ->
    @model.on('change',@render,this)

  render: ->
    $(@el).html(@template(item: @model))
    this

  showItem: ->
    Backbone.history.navigate("items/#{@model.get('id')}",true)

  editItem: ->
    $(@el).find('.todo').addClass('editing')
    $(@el).find('.todo > .edit > .todo-input')[0].value = @model.get('name')

  deleteItem: ->
    @model.destroy()
    $(@el).remove()

  updateState: ->
    @model.changeState()

  updateItem: (e) ->
    if e.which == 13
      name = $(@el).find('.todo > .edit > .todo-input')[0].value
      @model.set({name:name})
      @model.save()

