tag questions

	def build
		document:title = "Questions?"
		@getter = Getter:list[L.ns(__dirname, :get)].new
		@getter.load
		render
		self

	def render
		<self>
			<h1> "Ask your questions"
			<add_question[@getter]>
			<.list>
				question(el) for el in @getter.collection
			<more_questions> 'More'

	def question(el)
		<question[el]@{el:id}>
