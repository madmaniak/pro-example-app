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

	def ontouchstart t
		t.capture
		t:data = Path2D.new
		Store.add :paths, t:data

	def ontouchupdate t
		let path = t:data
		Store.add :dots, { x: t.tx, y: t.ty }, [path]
		path.lineTo(t.tx * dpr, t.ty * dpr)
		draw(path)

	def render
		draw(path) for path in L.values(Data:collections:paths)
		<self>

	def draw path
		context('2d').stroke(path)
