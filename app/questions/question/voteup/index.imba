tag voteup < button

	def onclick
		@dom:disabled = true
		Store.update object, 'app/questions/question/voteup'
