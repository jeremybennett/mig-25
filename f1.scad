// Former F1 for MiG-25 Model

// Copyright (C) 2014 Jeremy Bennett <jeremy@jeremybennett.com>

// Contributor: Jeremy Bennett <jeremy@jeremybennett.com>

// This file is licensed under the Creative Commons Attribution-ShareAlike 3.0
// Unported License. To view a copy of this license, visit
// http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative
// Commons, PO Box 1866, Mountain View, CA 94042, USA.

// 45678901234567890123456789012345678901234567890123456789012345678901234567890


module f1_flat () {
	polygon (points = [ [10.32,  0.00],
	                    [ 0.00, 10.32],
	                    [ 0.00, 40.48],
	                    [10.32, 50.80],
	                    [42.86, 50.80],
	                    [53.98, 38.89],
	                    [53.98, 11.91],
	                    [42.86,  0.00] ]);
}

module f1 (h) {
	linear_extrude (height = h)
		f1_flat ();
}

// 3/16" thick former
f1 (h = 4.76);
