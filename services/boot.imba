require 'imba'

require './../services/helpers'
require './../services/store'
require './../app'

def window.start
	global:_app = #app
	global.render

def window.render
	global:_app.render
