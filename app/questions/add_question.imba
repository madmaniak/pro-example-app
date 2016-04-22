tag add_question < form

	def render
		<self>
			<input@field autofocus='autofocus'>

	def onsubmit e
		e.cancel
		var value = @field.value
		@field.value = ""
		Dispatcher.send event: 'app/questions/add', value: value
