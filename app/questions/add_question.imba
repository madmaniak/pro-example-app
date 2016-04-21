tag add_question < form

	def render
		<self>
			<input@field>

	def onsubmit e
		e.cancel
		var value = @field.value
		@field.value = ""
		Store.add L.toHash(['questions', value: value])
