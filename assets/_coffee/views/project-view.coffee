define [], () ->
	ProjectView = Backbone.View.extend

		initialize: ->
			_.bindAll @
			@$el = $(@el)
			@$el.append "<table cellpadding=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr></tr></table>"
			_.each @$('img'), @fixImage
			$content = @$('.content')
			$content.wrap "<td class=\"description\"></td>"
			$content = $content.parents '.description'
			$(@$('.image')[0]).after $content


		fixImage: (el) ->
			$el = $(el)
			$el.wrap "<td class=\"image\"></td>"
			$el = $el.parents('.image')
			@$('tr').append $el

	ProjectView