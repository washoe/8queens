// Generated by CoffeeScript 1.6.2
(function() {
  require.config({
    deps: ['main'],
    paths: {
      plugins: 'scripts/plugins',
      jquery: '../bower_components/jquery/dist/jquery',
      underscore: '../bower_components/underscore/underscore',
      backbone: '../bower_components/backbone/backbone',
      use: 'plugins/use',
      text: 'plugins/text',
      templates: '../templates'
    },
    use: {
      backbone: {
        deps: ['use!underscore', 'jquery'],
        attach: 'Backbone'
      },
      underscore: {
        attach: '_'
      }
    }
  });

}).call(this);
