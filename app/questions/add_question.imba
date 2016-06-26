tag add_question < form

	def render
		<self>
			<input@field autofocus='autofocus'>

	def onsubmit e
		e.cancel
		var value = @field.value
		@field.value = ""
		Store.add :questions, value: value, votes: 0
