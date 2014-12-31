// Text imprinting for MiG-25 Model

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
	translate (v = [x * s, y * s, h * 5 / 6])
		rotate (a = [0, 0, a])
			translate (v = [0, -4 * s * (tc - 1), 0])
				8bit_str (chars = t, char_count = tc, block_size = s,
				          height = h / 3);
}
