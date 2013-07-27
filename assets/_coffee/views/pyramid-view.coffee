define [], () ->
	PyramidView = Backbone.View.extend

		width: 120
		height: 95
		
		initialize: ->
			_.bindAll @
			@$el = $(@el)
			@updateVariables()
			@render()
			return
			$(document).bind 'resize', @updateVariables
			$(document).bind 'mousemove', @updateEye
			$(document).bind 'touchmove', (e) =>
				touch = e.originalEvent.changedTouches[0];
				@updateEye
					clientX: touch.pageX
					clientY: touch.pageY
				return false

		updateVariables: ->
			@screenW = $(window).width()
			@screenH = $(window).height()

		render: ->
			# setup
			Two.Resolution = 24

			@two = new Two
				width: @width
				height: @height
			@two.appendTo document.getElementById('pyramid')

			# pyramid
			@pyramid = @two.makePolygon @width / 2, 0, @width, @height, 0, @height, false
			@pyramid.fill = 'rgb(247, 237, 16)'
			@pyramid.noStroke()

			# eye bg
			eye_bg = @two.makeCircle 60, 58, 22
			eye_bg.fill = '#FFF'
			eye_bg.noStroke()

			# pupil
			@pupil = @two.makeCircle 66, 65, 9
			@pupil.fill = '#000'
			@pupil.noStroke()
			@pupil.destination = new Two.Vector()

			@pupil.bind 'update', () =>
				console.log 'update pupil'
				@pupil.translation.x += (@pupil.destination.x - @pupil.translation.x) * 0.625
				@pupil.translation.y += (@pupil.destination.y - @pupil.translation.y) * 0.625

			# gloss
			gloss = @two.makeCircle 60, 52, 13
			gloss.fill = '#FFF'
			gloss.opacity = 0.4
			gloss.noStroke()

			@two.update()

		updateEye: (e) ->
			mouse = new Two.Vector(e.clientX, e.clientY);
			rect =
				left: 16
				top: 16
				width: 120
				height: 95
			center =
				x: rect.left + rect.width / 2
				y: rect.top + rect.height / 2
			theta = Math.atan2(mouse.y - center.y, mouse.x - center.x);
			distance = mouse.distanceTo(center)
			pct = distance / @screenW
			radius = 75 * pct;
			@pupil.destination.set(radius * Math.cos(theta), radius * Math.sin(theta));
			@two.update()
			
			return
			x = e.pageX
			y = e.pageY
			@pupil.translation.x = 30
			@pupil.translation.y = 30
			@two.update()
			

	PyramidView