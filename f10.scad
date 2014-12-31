// Former F10 for MiG-25 Model

// Copyright (C) 2014 Jeremy Bennett <jeremy@jeremybennett.com>

// Contributor: Jeremy Bennett <jeremy@jeremybennett.com>

// This file is licensed under the Creative Commons Attribution-ShareAlike 3.0
// Unported License. To view a copy of this license, visit
// http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative
// Commons, PO Box 1866, Mountain View, CA 94042, USA.

// 45678901234567890123456789012345678901234567890123456789012345678901234567890

use <MCAD/bitmap/bitmap.scad>
use <text-imprint.scad>


// The basic flat polygon

// @param s  Scale factor. Default 1
module f10_flat (s = 1) {
	polygon (points = [ [ 15.08 * s,  0.00 * s],
	                    [  0.00 * s, 15.08 * s],
	                    [  0.00 * s, 56.36 * s],
	                    [ 15.08 * s, 71.44 * s],
	                    [ 53.18 * s, 71.44 * s],
	                    [ 53.18 * s, 61.12 * s],
	                    [ 63.50 * s, 61.12 * s],,
	                    [ 63.50 * s, 71.44 * s],
	                    [ 97.63 * s, 71.44 * s],
	                    [ 97.63 * s, 61.12 * s],
	                    [107.95 * s, 61.12 * s],
	                    [107.95 * s, 71.44 * s],
	                    [146.05 * s, 71.44 * s],
	                    [161.13 * s, 56.36 * s],
	                    [161.13 * s, 15.08 * s],
	                    [146.05 * s,  0.00 * s] ]);
}


// Extrude and label the polygon

// @param h  Height of the piece.  Not affected by s
// @param s  Scale factor.  Default 1
module f10 (h, s = 1) {
	difference () {
		linear_extrude (height = h)
			f10_flat (s = s);
		text_imprint (s = s, t = ["F", "1", "0"], tc = 3, h = h, a = -90,
		              x = 161.13 / 2, y = 71.44 / 2);
		text_imprint (s = s, t = ["T", "O", "P"], tc = 3, h = h, a = -90,
		              x = 161.13/2, y = 60);
	}
}


// 3/16" thick former
f10 (h = 25.4 * 3 / 16, s = 1);
