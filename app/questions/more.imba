tag more_questions < button

	def onclick
		id = L.minBy L.values(L.keys(Store:collections:questions)), [:votes, :id]
		Requests.perform L.ns(__dirname, :get), after: id
