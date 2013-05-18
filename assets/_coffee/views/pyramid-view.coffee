define ['backbone', 'underscore', 'two'], (Backbone, _, Two) ->
	PyramidView = Backbone.View.extend

		width: 120
		height: 95
		
		initialize: ->
			_.bindAll @
			@$el = $(@el)
			@render()

		render: ->
			# setup
			@two = new Two
				width: @width
				height: @height
			@two.appendTo document.getElementById('pyramid')

			# pyramid
			pyramid = @two.makePolygon @width / 2, 0, @width, @height, 0, @height, false
			pyramid.fill = 'rgb(247, 237, 16)'
			pyramid.noStroke()

			# eye bg
			eye_bg = @two.makeCircle 60, 58, 22
			eye_bg.fill = '#FFF'
			eye_bg.noStroke()

			# pupil
			pupil = @two.makeCircle 66, 65, 9
			pupil.fill = '#000'
			pupil.noStroke()

			# gloss
			gloss = @two.makeCircle 60, 52, 13
			gloss.fill = '#FFF'
			gloss.opacity = 0.4
			gloss.noStroke()

			@two.update()

	PyramidView