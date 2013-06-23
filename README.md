8 Queens
=========

As simple programming exercise to solve the 8 Queens chess puzzle ( http://en.wikipedia.org/wiki/Eight_queens_puzzle )using a web app.

Technologies:

  - Web workers
  - Requirejs and AMD
  - Backbone
  - Coffeescript

A web worker is sued to work through 100,000 random positions. When a new solution is found, the Backbone collection is updated and an html rendition is added to the DOM. Inversions and other permutations are filtered out, meaning we can expect a total of 12 solutions.

Still to do
-
 - more sophisticated rendering, possibly using a proper chess js lib (e.g. https://github.com/bmarini/jchess)
 - better progess updates
 - other strategies for solving the problem - less brute force? Provide a way of choosing and comparing strategies.