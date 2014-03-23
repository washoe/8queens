# just the view
define ['jquery', 'use!underscore', 'use!backbone', 'modules/solution_view'],
($, _, Backbone, SolutionView)->
	Backbone.View.extend
		initialize: ()->
			console.log 'init collection view'
			#@model.view = new SolutionView({model: @collection.model})
			@listenTo @collection, 'add', @render
		render:(newmodel, collection, another_thing)->
			# when a solution is added, we render it and add it to the DOM
			$solutionEl = $('<li class="solution"/>').attr('id', newmodel.cid)
			$solutionEl.prependTo(@$el)
			solution_view = new SolutionView({model: newmodel, el: $solutionEl[0]})
			solution_view.render(newmodel)
			