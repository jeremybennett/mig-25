// Former F1 for MiG-25 Model

// Copyright (C) 2014 Jeremy Bennett <jeremy@jeremybennett.com>

// Contributor: Jeremy Bennett <jeremy@jeremybennett.com>

// This file is licensed under the Creative Commons Attribution-ShareAlike 3.0
// Unported License. To view a copy of this license, visit
// http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to Creative
// Commons, PO Box 1866, Mountain View, CA 94042, USA.

// 45678901234567890123456789012345678901234567890123456789012345678901234567890

use <MCAD/bitmap/bitmap.scad>


// Put the name at a location and height

// Text is along the Y axis, with the first char centered on the origin.  At
// scale 1 it has height 8mm.

// @param s   Scale factor. Default 1. Does not affect h
// @param t   Text to print
// @param tc  Number of chars to print
// @param h   Height of the piece
// @param a   Angle to rotate around Z
// @param x   x offset of text center
// @param y   y offset of text center
module text_imprint (s = 1, t, tcount, h, a, x, y) {
	translate (v = [x * s, y * s, h * 9 / 10])
		rotate (a = [0, 0, a])
			translate (v = [0, -4 * s * (tc - 1), 0])
				8bit_str (chars = t, char_count = tc, block_size = s,
				          height = h / 5);
}


// The basic flat polygon

// @param s  Scale factor. Default 1
module f1_flat (s = 1) {
	polygon (points = [ [10.32 * s,  0.00 * s],
	                    [ 0.00 * s, 10.32 * s],
	                    [ 0.00 * s, 40.48 * s],
	                    [10.32 * s, 50.80 * s],
	                    [42.86 * s, 50.80 * s],
	                    [53.98 * s, 38.89 * s],
	                    [53.98 * s, 11.91 * s],
	                    [42.86 * s,  0.00 * s] ]);
}


// Extrude and label the polygon

// @param h  Height of the piece.  Not affected by s
// @param s  Scale factor.  Default 1
module f1 (h, s = 1) {
	difference () {
		linear_extrude (height = h)
			f1_flat (s = s);
		text_imprint (s = s, t = ["F", "1"], tc = 2, h = h, a = 0,
		              x = 53.98 / 2, y = 50.80 / 2);
		text_imprint (s = s, t = ["T", "O", "P"], tc = 3, h = h, a = 0,
		              x = 5, y = 50.80 / 2);
	}
}


// 3/16" thick former
f1 (h = 25.4 * 3 / 16, s = 1);
