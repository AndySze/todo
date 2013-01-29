class Todo.Views.ItemsIndex extends Backbone.View

  template: JST['items/index']

  events:
    'keypress #new-todo' : 'newItem'
    'click .todo-clear > a' : 'clear'

  initialize: ->
    @collection.on('reset',@render,this)
    @collection.on('add',@addOne,this)
    @collection.on('all',@updateCount,this)

  addOne: (item) =>
    view = new Todo.Views.Item(model: item)
    @$('#todo-list').append(view.render().el)

  removeItem: (item) ->
    if item.get('done')
      item.destroy()

  render: ->
    $(@el).html(@template())
    @collection.each(@addOne)
    @updateCount
    this

  newItem: (e) ->
    if e.which == 13
      attributes = name: $('#new-todo').val()
      @collection.create attributes,
        wait: true
        success: -> $('#new-todo')[0].value = ''

  updateCount: ->
    @count = @collection.where({done: false}).length
    @$('#todo-stats').find('.number').html(@count)

  clear: ->
    @collection.each(@removeItem)
