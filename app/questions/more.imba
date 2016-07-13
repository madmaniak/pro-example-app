tag more_questions < button

	def onclick
		id = L.minBy L.values(L.keys(Store:collections:questions)), [:votes, :id]
		Dispatcher.send event: L.ns(__filename, :get), after: id
