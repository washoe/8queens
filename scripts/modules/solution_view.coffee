# just the view
define ['jquery', 'use!underscore', 'use!backbone', 'text!templates/solution_template.html'],
($, _, Backbone, template_html)->
	Backbone.View.extend
		initialize: ()->
			@$template = $(template_html).hide()
			# tagName = 'li'
			
			console.log 'init model'
		render:(model,collection,thing)->
			# when a solution is added, we render it and add it to the DOM
			
			# here is where we do the html rendering
			for row, i in model.get('position')
				$row = $(@$template.find('tr').get(row))
				$square = $($row.find('td').get(i))
				$square.html('<div class="piece"/>')
				
				
			# TODO - add smaller markers showing possible moves.
			# also, colour each queen and her markers differently
			# add rollover highlights - show queens on board hover, show moves on queen hover
				
			@$el.append(@$template)
			@$template.fadeIn()