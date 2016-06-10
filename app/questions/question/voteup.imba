Actions['app/questions/question/voteup'] = do |object|
	object:votes += 1

tag voteup < button

	def render
		<self> "+"

	def onclick
		@dom:disabled = true
		Store.update object, 'app/questions/question/voteup'
