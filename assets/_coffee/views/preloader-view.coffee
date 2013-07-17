define ['backbone', 'underscore'], (Backbone, _) ->
	PreloaderView = Backbone.View.extend

		initialize: ->
			_.bindAll @
			@$el = $(@el)
			_.delay @remove, 300

	PreloaderView