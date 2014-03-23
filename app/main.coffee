# main app
require ['jquery','use!underscore','use!backbone', 'modules/solution_collection_view', 'modules/stats_view'],
($, _, Backbone, SolutionCollectionView, StatsView)->
	tries = 10000
	Solution = Backbone.Model.extend()
	Solutions = Backbone.Collection.extend
		model: Solution
	solutions = new Solutions()
	Stats = Backbone.Model.extend()
	stats = new Stats
		tries:tries
		uniqueGuesses: 0
		solutions:0
		time: 0
	
	solutionCollectionView = new SolutionCollectionView
		collection:solutions
		el:$('#solutions')[0]
	statsView = new StatsView
		model: stats
		el:$('#stats')[0]
	
	worker = new Worker('app/workers/worker.js')
	
	worker.onmessage = (event)->
		console.log 'from worker:  '+JSON.stringify(event.data)
		if event.data.hasOwnProperty('solution')
			s = new Solution({position: event.data.solution})
			solutions.add ({position: event.data.solution})
			$('#stats').html event.data.total + ' solutions, ' +event.data.uniqueGuesses+' guesses'
		if event.data.hasOwnProperty('solutions')
			console.log solutions.toJSON()
	worker.postMessage({test: true, numberOfTries:100000})
	
	

	
