# require config

require.config
	deps: ['main']
	paths:
		libs: '../assets/js/libs'
		plugins:'../assets/js/plugins'
		jquery: '../assets/js/libs/jquery/jquery'
		underscore:'../assets/js/libs/underscore'
		backbone:'../assets/js/libs/backbone'
		use:'../assets/js/plugins/use'
		text:'../assets/js/plugins/text'
		templates:'templates'
	use:
		backbone:
			deps:['use!underscore', 'jquery']
			attach: 'Backbone'
		underscore:
			attach: '_' 
