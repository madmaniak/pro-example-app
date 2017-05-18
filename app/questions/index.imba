tag questions

	def setup
		@questions = Collection:list[L.ns(__dirname, :get)].new.load

	def render
		document:title = "Questions?"
		<self>
			<h1> "Ask your questions"
			<add_question[@questions]>
			<.list>
				question(el) for el in @questions.elements
			<more_questions> 'More'

	def question(el)
		<question[el]@{el:id}>
