class Todo.Models.Item extends Backbone.Model

  changeState: ->
    if @get('done')
      @set(done: false)
    else
      @set(done:true)

    @save()

