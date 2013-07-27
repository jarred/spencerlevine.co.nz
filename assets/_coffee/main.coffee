SL = window.SpencerLevine ||= {}
SL.Views = {}

SL.App =
	init: ->
		@appModel = new Backbone.Model()
		@extendViews()

	extendViews: ->
		_.each $('.js-extend-view'), (el) =>
			$el = $(el)
			viewName = $el.data('view')
			return if viewName is null or viewName is undefined
			view = SL.Views[viewName]
			v = new view
				el: el
			$el.removeClass 'js-extend-view'