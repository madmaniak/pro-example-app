global.Dispatcher = require("backbone-events-standalone")

primusI = Primus.connect 'http://localhost:8087'
primusO = Primus.connect 'http://localhost:8088'
primusO.on 'open', ->
  primusI.id (id) ->
    primusO.write(id)
    start()

Dispatcher.send = (data) -> primusI.write data
primusO.on 'data', (data) ->
  console.log data
  if data.event
    Dispatcher.trigger data.event, data
  else if data != "benchmarked!"
    Store.update JSON.parse(data)
