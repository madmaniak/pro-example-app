require '../framework/components/router/pro-imba-router'
R.init(views: Views, helpers: L, render: do global.render)

tag #app

	def render
		<self>
			<ref go='/'> 'Sketchpad demo'
			<ref go='/questions'> 'Questions'
			<ref go='/404'> 'Wrong way'
			<router[R:view]>
