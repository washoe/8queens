# main app
require ['jquery','use!underscore','use!backbone', 'modules/solution_collection_view'],
($, _, Backbone, SolutionCollectionView)->
	Solution = Backbone.Model.extend()
	Solutions = Backbone.Collection.extend
		model: Solution
	solutions = new Solutions()
	
	solutionCollectionView = new SolutionCollectionView({collection:solutions, el:$('#solutions')[0]})
	
	worker = new Worker('app/workers/worker.js')
	
	worker.onmessage = (event)->
		console.log 'from worker:  '+JSON.stringify(event.data)
		if event.data.hasOwnProperty('solution')
			s = new Solution({position: event.data.solution})
			solutions.add ({position: event.data.solution})
			$('#count').html event.data.total + ' solutions, ' +event.data.uniqueGuesses+' guesses'
		if event.data.hasOwnProperty('solutions')
			console.log solutions.toJSON()
	worker.postMessage({test: true, numberOfTries:100000})
	
	

	
