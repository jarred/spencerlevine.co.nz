define ['backbone', 'underscore'], (Backbone, _) ->
	PreloaderView = Backbone.View.extend

		initialize: ->
			_.bindAll @
			@$el = $(@el)
			_.defer @remove

	PreloaderView