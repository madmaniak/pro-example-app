tag voteup < button

	def onclick
		@dom:disabled = true
		Store.update data, 'app/questions/question/voteup'
