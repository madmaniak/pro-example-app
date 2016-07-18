tag questions

	def build
		document:title = "Questions?"
		Requests.perform L.ns(__dirname, :get)
		self

	def render
		<self>
			<h1> "Ask your questions"
			<add_question>
			<.order>
				question(el) for el in L.values(Store:collections:questions)
			<more_questions> 'More'

	def question(el)
		<question[el]@{el:id} style="order: {el:votes}">
