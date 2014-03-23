# just the view
define ['jquery', 'use!underscore', 'use!backbone', 'text!templates/stats_template.html'],
($, _, Backbone, template_html)->
	Backbone.View.extend
		initialize: ()->
			@$template = _.template(unescape(template_html))
			
			console.log 'init stats model'
			# will render total tries, unique guesses, solutions, time
			# use https://github.com/neoziro/circular-progress ?
			@listenTo @model, 'change', @render
		render: (model)->
			console.log 'stadt render'
			@$el.html(@$template(model.toJSON()))
			