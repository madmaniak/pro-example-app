Dispatcher.on 'voteup', do |data|
	Store:collections:questions[data:id]:votes += 1
	render

tag voteup < button

	def render
		<self> "+"

	def onclick
		@dom:disabled = true
		Dispatcher.send event: 'app/questions/question/voteup', id: object
