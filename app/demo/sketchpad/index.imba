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
		@getter = Getter:list[L.ns(__dirname, :get_paths)].new
		@getter.load
		render
		self

	def ontouchstart t
		t.capture
		t:data = {}
		@getter.create t:data

	def ontouchupdate t
		t:data:dots.create { x: t.tx, y: t.ty }

	def render
		draw(path) for path in @getter.collection
		<self>

	def draw(data)
		let dots = data:dots.collection
		let dots_to_draw = L.takeRight dots, dots:length - (data:_cursor || 0)
		data:_cursor = dots:length
		data:_path ||= Path2D.new

		if dots_to_draw:length
			for dot in dots_to_draw
				if dot
					data:_path.lineTo(dot:x * dpr, dot:y * dpr )
			context('2d').stroke(data:_path)
