require './question'
require './add_question'
require('./questions.scss')

tag questions

	def build
		document:title = "Questions?"
		Dispatcher.send event: 'app/questions/get'
		render
		self

	def render
		<self>
			<h1> "Ask your questions"
			<add_question>
			<.order>
				question(el) for el in L.values(Data:collections:questions)

	def question(el)
		<question[el]@{el:id} style="order: {el:votes}">
