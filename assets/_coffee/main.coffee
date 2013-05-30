require.config
	baseUrl: '/assets/js/libs'
	waitSeconds: 10
	paths:
		app: '../app'
		jquery: 'jquery-1.9.1'
		two: 'two.min'
	shim:
		backbone:
			deps: ['jquery', 'underscore']
			exports: 'Backbone'
		underscore:
			exports: '_'
		jquery:
			exports: '$'
		history:
			deps: ['jquery']
			exports: 'History'
		two:
			deps: ['backbone', 'underscore']
			exports: 'Two'

# load the stack and init the app.
require ['jquery', 'backbone', 'underscore', 'history', 'two'], () ->

	views = [
		'app/views/pyramid-view'
		'app/views/project-view'
		'app/views/preloader-view'
	]

	App = 
		init: ->
			@appModel = new Backbone.Model()
			require views, @extendViews

		extendViews: ->
			_.each $('.js-extend-view'), (el) =>
				$el = $(el)
				viewName = $el.data('view')
				return if viewName is null or viewName is undefined
				view = require("app/views/#{viewName}")
				v = new view
					el: el
				$el.removeClass 'js-extend-view'

	App.init()