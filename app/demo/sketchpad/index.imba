require './sketchpad.scss'

extend tag canvas

	def dpr
		@dpr ||= window:devicePixelRatio || 1

	def width= width
		if width != @width
			dom:width = width * dpr
			css width: width
			@width = width
		self

	def height= height
		if height != @height
			dom:height = height * dpr
			css height: height
			@height = height
		self

tag sketchpad < canvas

	def build
		Dispatcher.send event: 'app/demo/sketchpad/get_paths'
		self

	def ontouchstart t
		t.capture
		t:data = {}
		Store.add :paths, t:data

	def ontouchupdate t
		Store.add :dots, { x: t.tx, y: t.ty }, [t:data]

	def render
		draw(path) for path in L.values(Store:collections:paths)
		<self>

	def draw(data)
		let dots = Store.get :dots, data:dots
		let dots_to_draw = L.takeRight dots, dots:length - (data:_cursor || 0)
		data:_cursor = dots:length
		data:_path ||= Path2D.new

		if dots_to_draw:length
			data:_path.lineTo(dot:x * dpr, dot:y * dpr ) for dot in dots_to_draw
			context('2d').stroke(data:_path)
