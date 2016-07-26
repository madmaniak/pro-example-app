tag add_question < form

	def render
		<self>
			<input@field autofocus='autofocus'>

	def onsubmit e
		e.cancel
		var value = @field.value
		@field.value = ""
		object.create value: value, votes: 0
