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
		@i = 0

	def ontouchupdate t
		t:data:dots.create { x: t.tx, y: t.ty, i: @i++ }

	def render
		draw(path) for path in @getter.collection
		<self>

	def draw(data)
		let dot
		let dots = data:dots.collection
		let i = data:_cursor || 0

		if i < dots:length
			data:_path ||= Path2D.new
			while i < dots:length
				if dot = dots[i]
					data:_path.lineTo(dots[i]:x * dpr, dot:y * dpr )
				i++

			context('2d').stroke(data:_path)
			data:_cursor = dots:length
