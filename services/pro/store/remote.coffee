module.exports =
  add: (name, object, relations) ->
    object['id'] = L.uniqueId("tmp")
    object['type'] = name

    Dispatcher.send {
      object: L.assign {}, object
      relations: L.map(relations, L.reference)
      event: L.ns(__filename, 'add')
    }
    arguments

  update: (object, transition, params) ->
    Dispatcher.send {
      params
      transition
      ref: L.reference(object)
      event: L.ns(__filename, 'update')
      v: object.v
    }
    arguments

  delete: (object) ->
    Dispatcher.send {
      ref: L.reference(object)
      event: L.ns(__filename, 'delete')
    }
    arguments

# response from the server on add
Dispatcher.on 'real_id', (data) ->
  change = data.change
  # find object with tmp_id
  object = Store.get(change.collection, change.tmp_id)[0]
  object.id = change.id
  # store object with real id
  Store.collections[change.collection][change.id] = object
  delete Store.collections[change.collection][change.tmp_id]
  Dispatcher.trigger "#{change.tmp_id}_to_id"
