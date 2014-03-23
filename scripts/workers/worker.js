// 8 queens tester as web worker

// modifications
// use proper notation - A-H for x axis, 1-8 for Y axis
//['A1', 'B2'.. 'H8']
// or more generic points:
// [{x:0, y:0}, {x:1, y:1}..]

// when a solution is found, identify rotations and either
// add them, or just check for them

// different methods:
// create a random position and move pieces one at a time
// start with 1 piece, add 1 by 1 and check each time. if no position is possible start again

// ? keep going row at a time, or more fully random?

var method = function(){}
  
self.addEventListener('message', function(e) {

	// {test:true, numberOfTries:1000}
	if (e.data.hasOwnProperty('test'))
	{
		dotest(e.data.numberOfTries)
	}
}, false);

var dotest = function(numberOfTries) {
	var tries = [];
	var solutions = []
	var uniqueGuesses = 0;
	for (var i = 0; i <numberOfTries; i++) {
		var g = method1();
		if (checkUniqueness(g, tries)){
			uniqueGuesses ++;
			tries.push(g.join(''));
			if (test(g)) {
				solutions.push(g);
				self.postMessage({solution: g, total: solutions.length, uniqueGuesses: uniqueGuesses});
			}
		}
	}
	result = {solutions: solutions, uniqueGuesses: uniqueGuesses}
	self.postMessage(result);
}


// filter out permutations of the same solution

// retrograde = backwards (horizontal reflection
// inversion = upside down (vertical reflection)
// retrograde inversion = 180 degree rotation (?)
// plus all these permutations of a 90 degree rotation

var checkUniqueness = function(g, tries) {
	var result = tries.indexOf(g.join('')) == -1
	result = result && tries.indexOf(getRetrograde(g).join('')) == -1
	result = result && tries.indexOf(getInversion(g).join('')) == -1
	result = result && tries.indexOf(getRetrogradeInversion(g).join('')) == -1
	r = getRotation(g)
	result = result && tries.indexOf(r.join('')) == -1
	result = result && tries.indexOf(getRetrograde(r).join('')) == -1
	result = result && tries.indexOf(getInversion(r).join('')) == -1
	result = result && tries.indexOf(getRetrogradeInversion(r).join('')) == -1
	return result;
}
  
  
var method1 = function() {
	// method 
	// assign 1 queen per row, 1 per column
	// this should avoid any row / column clashes)
	result = randomise([0,1,2,3,4,5,6,7]);
	return result
}

var getRetrograde = function(g) {
	return g.slice().reverse()
}

var getInversion = function(g) {
	result = [];
	for (var i = 0; i < g.length; i++) {
		result [i] = 7 - g[i]
	}
	return result;
}

var getRetrogradeInversion = function (g) {
	return getRetrograde(getInversion(g));
}

var getRotation = function(g) {
	// rotate, e.g. key becomes value
	result = [];
	for (var i = 0; i < g.length; i++) {
		result [g[i]] = i;
	}
	return result;


}





var test = function(g) {
	for (var i = 0; i < g.length; i++) {
		for (var j = 0; j < g.length; j++) {
			if (i !=j) { 
				// test for horizontal clash
				if (g[i] == g[j]) {
					//console.log ('row clash');
					return false;
				}
				// test for diagonal clash
				if (g[i] - i == g[j] -j || g[i]+i == g[j]+j){
					//console.log ('diagonal clash');
					return false;
				}
			}
		}
	}
	return true;
};
var randomise = function(array) {
	// randomise (using fisher-yates shuffle - ref http://bost.ocks.org/mike/shuffle/
	m = array.length;
	while(m)
	{
		i = Math.floor(Math.random() * m--);
		t = array[m];
		array[m] = array[i];
		array[i] = t;
	}
	return array
}

