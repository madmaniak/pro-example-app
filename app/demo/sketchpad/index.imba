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
		@add_dot = L.throttle do |t|
			t:data:dots.add { x: t.tx, y: t.ty, i: @i++ }
		, 20
		@paths = Collection:list[L.ns(__dirname, :get_paths)].new.load
		render
		self

	def ontouchstart t
		t.capture
		t:data = {}
		@paths.add t:data
		@i = 0

	def ontouchupdate t
		@add_dot t

	def render
		draw(path) for path in @paths.elements
		<self>

	def draw(path)
		let dot
		let dots = path:dots.elements
		let i = path:_cursor || 0

		if i < dots:length
			path:_path ||= Path2D.new
			while i < dots:length
				if dot = dots[i]
					path:_path.lineTo(dots[i]:x * dpr, dot:y * dpr )
				i++

			context('2d').stroke(path:_path)
			path:_cursor = dots:length
