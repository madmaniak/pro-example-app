require './question'
require './add_question'

tag questions

	def build
		document:title = "Questions?"
		Dispatcher.send event: 'app/questions/get'
		render
		self

	def render
		<self>
			<h1> "Ask your questions"
			question(el) for el in L.values(Store:collections:questions)
			<add_question>

	def question(el)
		<question[el]@{el:id}>
