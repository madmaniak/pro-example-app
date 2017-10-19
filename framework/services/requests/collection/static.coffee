class Collection.Static extends Collection

  constructor: ->
    super
    @key_values = L.map @constructor.order, 0

  more: ->     @go ids: @scope
  page: (i, params = {}) ->
    new @constructor undefined, L.merge(params, page: i), @belongs_to

  prev: ->
    key = @_get_key L.first(@scope)
    @go before: key, (scope) => @scope = L.reverse(scope).concat @scope

  next: ->
    key = @_get_key L.last(@scope)
    @go after: key, (scope) => @scope = @scope.concat scope

  _get_key: (id) ->
    object = @_object(id); key = []
    for attr in @key_values
      if v = object[attr] then key.push(v) else return id
    key
