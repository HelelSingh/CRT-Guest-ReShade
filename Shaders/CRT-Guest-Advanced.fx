/*

	CRT - Guest - Advanced

	Copyright (C) 2018-2025 guest(r)

	Incorporates many good ideas and suggestions from Dr. Venom.

	I would also like give thanks to many Libretro forums members for continuous feedback, suggestions and using the shader.

	This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
	See the GNU General Public License for more details.

	You should have received a copy of the GNU General Public License along with this program; if not,
	write to the Free Software Foundation, Inc, 59 Temple Place - STE 330, Boston, MA 02111-1307, USA.

	Ported to ReShade by DevilSingh with some help from guest(r)

*/

uniform float PR <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.5;
	ui_step = 0.01;
	ui_label = "Persistence 'R'";
> = 0.32;

uniform float PG <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.5;
	ui_step = 0.01;
	ui_label = "Persistence 'G'";
> = 0.32;

uniform float PB <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.5;
	ui_step = 0.01;
	ui_label = "Persistence 'B'";
> = 0.32;

uniform float AS <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.6;
	ui_step = 0.01;
	ui_label = "Afterglow Strength";
> = 0.2;

uniform float ST <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Afterglow Saturation";
> = 0.5;

uniform float CS <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "Display Gamut: sRGB | Modern | DCI | Adobe | Rec. 2020";
> = 0.0;

uniform float CP <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 5.0;
	ui_step = 1.0;
	ui_label = "CRT Profile: EBU | P22 | SMPTE-C | Philips | Trinitron";
> = 0.0;

uniform float TNTC <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "LUT Colors: Trinitron 1 | Trinitron 2 | Nec MultiSync | NTSC";
> = 0.0;

uniform float LUTLOW <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Fix LUT Dark Range";
> = 5.0;

uniform float LUTBR <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Fix LUT Brightness";
> = 1.0;

uniform float WP <
	ui_type = "drag";
	ui_min = -100.0;
	ui_max = 100.0;
	ui_step = 5.0;
	ui_label = "Color Temperature %";
> = 0.0;

uniform float wp_saturation <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Saturation Adjustment";
> = 1.0;

uniform float pre_bb <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.01;
	ui_label = "Brightness Adjustment";
> = 1.0;

uniform float contra <
	ui_type = "drag";
	ui_min = -2.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Contrast Adjustment";
> = 0.0;

uniform float sega_fix <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "Sega Brightness Fix";
> = 0.0;

uniform float BP <
	ui_type = "drag";
	ui_min = -100.0;
	ui_max = 25.0;
	ui_step = 1.0;
	ui_label = "Raise Black Level";
> = 0.0;

uniform float vigstr <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Vignette Strength";
> = 0.0;

uniform float vigdef <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 3.0;
	ui_step = 0.1;
	ui_label = "Vignette Size";
> = 1.0;

uniform float lsmooth <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Raster Bloom Effect Smoothing";
> = 0.7;

uniform float gamma_i <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 5.0;
	ui_step = 0.05;
	ui_label = "Gamma Input";
> = 2.4;

uniform float gamma_o <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 5.0;
	ui_step = 0.05;
	ui_label = "Gamma Out";
> = 2.4;

uniform float interr <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 800.0;
	ui_step = 25.0;
	ui_label = "Interlace Trigger Resolution / VGA Trigger";
> = 375.0;

uniform float interm <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 5.0;
	ui_step = 1.0;
	ui_label = "Interlace Mode: 0:OFF | 1-3:Normal | 4-5:Interpolation";
> = 4.0;

uniform float iscanb <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Interlacing Scanlines Effect (Interlaced Brightness)";
> = 0.2;

uniform float iscans <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Interlacing Scanlines Saturation";
> = 0.25;

uniform float vga_mode <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "VGA Single/Double Scan Mode";
> = 0.0;

uniform float hiscan <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "High Resolution Scanlines (Prepend A Scaler)";
> = 0.0;

uniform float intres <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 10.0;
	ui_step = 0.5;
	ui_label = "Internal Resolution Y: 0.5 | Y-Dowsample";
> = 0.0;

uniform float downsample_levelx <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 3.0;
	ui_step = 0.05;
	ui_label = "Downsampling-X (High-Res Content, Pre-Scalers)";
> = 0.0;

uniform float downsample_levely <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 3.0;
	ui_step = 0.05;
	ui_label = "Downsampling-Y (High-Res Content, Pre-Scalers)";
> = 0.0;

uniform float m_glow <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Ordinary Glow | Magic Glow";
> = 0.0;

uniform float m_glow_cutoff <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.4;
	ui_step = 0.01;
	ui_label = "Magic Glow Cutoff";
> = 0.12;

uniform float m_glow_low <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 7.0;
	ui_step = 0.05;
	ui_label = "Magic Glow Low Strength";
> = 0.35;

uniform float m_glow_high <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 7.0;
	ui_step = 0.1;
	ui_label = "Magic Glow High Strength";
> = 5.0;

uniform float m_glow_dist <
	ui_type = "drag";
	ui_min = 0.2;
	ui_max = 4.0;
	ui_step = 0.05;
	ui_label = "Magic Glow Distribution";
> = 1.0;

uniform float m_glow_mask <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.025;
	ui_label = "Magic Glow Mask Strength";
> = 1.0;

uniform float FINE_GAUSS <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 5.0;
	ui_step = 1.0;
	ui_label = "Fine (Magic) Glow Sampling";
> = 1.0;

uniform float SIZEH <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Horizontal Glow Radius";
> = 6.0;

uniform float SIGMA_H <
	ui_type = "drag";
	ui_min = 0.2;
	ui_max = 15.0;
	ui_step = 0.05;
	ui_label = "Horizontal Glow Sigma";
> = 1.2;

uniform float SIZEV <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Vertical Glow Radius";
> = 6.0;

uniform float SIGMA_V <
	ui_type = "drag";
	ui_min = 0.2;
	ui_max = 15.0;
	ui_step = 0.05;
	ui_label = "Vertical Glow Sigma";
> = 1.2;

uniform float FINE_BLOOM <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 5.0;
	ui_step = 1.0;
	ui_label = "Fine Bloom/Halation Sampling";
> = 1.0;

uniform float SIZEX <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Horizontal Bloom/Halation Radius";
> = 3.0;

uniform float SIGMA_X <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 15.0;
	ui_step = 0.025;
	ui_label = "Horizontal Bloom/Halation Sigma";
> = 0.75;

uniform float SIZEY <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 50.0;
	ui_step = 1.0;
	ui_label = "Vertical Bloom/Halation Radius";
> = 3.0;

uniform float SIGMA_Y <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 15.0;
	ui_step = 0.025;
	ui_label = "Vertical Bloom/Halation Sigma";
> = 0.60;

uniform float glow <
	ui_type = "drag";
	ui_min = -2.0;
	ui_max = 2.0;
	ui_step = 0.01;
	ui_label = "(Magic) Glow Strength";
> = 0.08;

uniform float blm_1 <
	ui_type = "drag";
	ui_min = -2.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Bloom Strength";
> = 0.0;

uniform float b_mask <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 1.0;
	ui_step = 0.025;
	ui_label = "Bloom Mask Strength";
> = 0.0;

uniform float mask_bloom <
	ui_type = "drag";
	ui_min = -2.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Mask Bloom";
> = 0.0;

uniform float bloom_dist <
	ui_type = "drag";
	ui_min = -2.0;
	ui_max = 3.0;
	ui_step = 0.05;
	ui_label = "Bloom Distribution";
> = 0.0;

uniform float halation <
	ui_type = "drag";
	ui_min = -2.0;
	ui_max = 2.0;
	ui_step = 0.025;
	ui_label = "Halation Strength";
> = 0.0;

uniform float h_mask <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 1.0;
	ui_step = 0.025;
	ui_label = "Halation Mask Strength";
> = 0.5;

uniform float gamma_c <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 2.0;
	ui_step = 0.025;
	ui_label = "Gamma Correct";
> = 1.0;

uniform float gamma_d <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 2.0;
	ui_step = 0.025;
	ui_label = "Complementary Gamma Correct";
> = 1.0;

uniform float brightboost1 <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 10.0;
	ui_step = 0.05;
	ui_label = "Bright Boost Dark Pixels";
> = 1.4;

uniform float brightboost2 <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 3.0;
	ui_step = 0.025;
	ui_label = "Bright Boost Bright Pixels";
> = 1.1;

uniform float clp <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Clip Saturated Color Beams";
> = 0.0;

uniform float gsl <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Scanlines Type";
> = 0.0;

uniform float scanline1 <
	ui_type = "drag";
	ui_min = -20.0;
	ui_max = 40.0;
	ui_step = 0.5;
	ui_label = "Scanlines Beam Shape Center";
> = 6.0;

uniform float scanline2 <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 70.0;
	ui_step = 1.0;
	ui_label = "Scanlines Beam Shape Edges";
> = 8.0;

uniform float beam_min <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 10.0;
	ui_step = 0.05;
	ui_label = "Scanlines Shape Dark Pixels";
> = 1.3;

uniform float beam_max <
	ui_type = "drag";
	ui_min = 0.2;
	ui_max = 3.5;
	ui_step = 0.025;
	ui_label = "Scanlines Shape Bright Pixels";
> = 1.0;

uniform float tds <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "Thinner Dark Scanlines";
> = 0.0;

uniform float beam_size <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Increased Bright Scanlines Beam";
> = 0.6;

uniform float scans <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 6.0;
	ui_step = 0.1;
	ui_label = "Scanlines Saturation / Mask Falloff";
> = 0.5;

uniform float scan_falloff <
	ui_type = "drag";
	ui_min = 0.1;
	ui_max = 2.0;
	ui_step = 0.025;
	ui_label = "Scanlines Falloff";
> = 1.0;

uniform float spike <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.1;
	ui_label = "Scanlines Spike Removal";
> = 1.0;

uniform float scangamma <
	ui_type = "drag";
	ui_min = 0.5;
	ui_max = 5.0;
	ui_step = 0.05;
	ui_label = "Scanlines Gamma";
> = 2.4;

uniform float rolling_scan <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Rolling Scanlines";
> = 0.0;

uniform float no_scanlines <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.5;
	ui_step = 0.05;
	ui_label = "No-Scanlines Mode";
> = 0.0;

uniform float h_sharp <
	ui_type = "drag";
	ui_min = 0.2;
	ui_max = 15.0;
	ui_step = 0.1;
	ui_label = "Horizontal Sharpness";
> = 5.2;

uniform float s_sharp <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.1;
	ui_label = "Substractive Sharpness (1.0 Recommended)";
> = 0.5;

uniform float ring <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 3.0;
	ui_step = 0.05;
	ui_label = "Substractive Sharpness Ringing";
> = 0.0;

uniform float smart_ei <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.75;
	ui_step = 0.01;
	ui_label = "Smart Edges Effect Strength";
> = 0.0;

uniform float ei_limit <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.75;
	ui_step = 0.01;
	ui_label = "Smart Edges Effect Strength Limit";
> = 0.25;

uniform float sth <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Smart Edges Smoothing Threshold";
> = 0.23;

uniform float TATE <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "TATE Mode";
> = 0.0;

uniform float IOS <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "Integer Scaling: Odd:Y | Even:X+Y";
> = 0.0;

uniform float OS <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 1.0;
	ui_label = "Raster Bloom Overscan Mode";
> = 1.0;

uniform float blm_2 <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 20.0;
	ui_step = 1.0;
	ui_label = "Raster Bloom %";
> = 0.0;

uniform float csize <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.35;
	ui_step = 0.01;
	ui_label = "Corner Size";
> = 0.0;

uniform float bsize <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.01;
	ui_label = "Border Size";
> = 0.0;

uniform float sborder <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Border Intensity";
> = 0.75;

uniform float barspeed <
	ui_type = "drag";
	ui_min = 5.0;
	ui_max = 200.0;
	ui_step = 1.0;
	ui_label = "Hum Bar Speed";
> = 50.0;

uniform float barintensity <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 1.0;
	ui_step = 0.01;
	ui_label = "Hum Bar Intensity";
> = 0.0;

uniform float bardir <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "Hum Bar Direction";
> = 0.0;

uniform float warpx <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.25;
	ui_step = 0.01;
	ui_label = "Curvature X (Default 0.03)";
> = 0.0;

uniform float warpy <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.25;
	ui_step = 0.01;
	ui_label = "Curvature Y (Default 0.04)";
> = 0.0;

uniform float c_shape <
	ui_type = "drag";
	ui_min = 0.05;
	ui_max = 0.6;
	ui_step = 0.05;
	ui_label = "Curvature Shape";
> = 0.25;

uniform float overscanx <
	ui_type = "drag";
	ui_min = -200.0;
	ui_max = 200.0;
	ui_step = 1.0;
	ui_label = "Overscan X Original Pixels";
> = 0.0;

uniform float overscany <
	ui_type = "drag";
	ui_min = -200.0;
	ui_max = 200.0;
	ui_step = 1.0;
	ui_label = "Overscan Y Original Pixels";
> = 0.0;

uniform float shadow_msk <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 14.0;
	ui_step = 1.0;
	ui_label = "CRT Mask: 1:CGWG | 2-5:Lottes | 6-14:Trinitron";
> = 1.0;

uniform float maskstr <
	ui_type = "drag";
	ui_min = -0.5;
	ui_max = 1.0;
	ui_step = 0.025;
	ui_label = "Mask Strength (1, 6-14)";
> = 0.3;

uniform float mcut <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Mask 6-14 Low Strength";
> = 1.1;

uniform float maskboost <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 3.0;
	ui_step = 0.05;
	ui_label = "CRT Mask Boost";
> = 1.0;

uniform float masksize <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "CRT Mask Size";
> = 1.0;

uniform float mask_zoom <
	ui_type = "drag";
	ui_min = -10.0;
	ui_max = 6.0;
	ui_step = 1.0;
	ui_label = "CRT Mask Zoom (+ Mask Width)";
> = 0.0;

uniform float zoom_mask <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "CRT Mask Zoom Sharpen";
> = 0.0;

uniform float mshift <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.5;
	ui_label = "(Transform to) Shadow Mask";
> = 0.0;

uniform float mask_layout <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "Mask Layout: RGB or BGR (Check LCD Panel)";
> = 0.0;

uniform float mask_drk <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Lottes Mask Dark";
> = 0.5;

uniform float mask_lgt <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.05;
	ui_label = "Lottes Mask Bright";
> = 1.5;

uniform float mask_gamma <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 5.0;
	ui_step = 0.05;
	ui_label = "Mask Gamma";
> = 2.4;

uniform float slotmask1 <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Slot Mask Strength Bright Pixels";
> = 0.0;

uniform float slotmask2 <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Slot Mask Strength Dark Pixels";
> = 0.0;

uniform float slotwidth <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 16.0;
	ui_step = 1.0;
	ui_label = "Slot Mask Width (0:Auto)";
> = 0.0;

uniform float double_slot <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "Slot Mask Height: 2x1 or 4x1";
> = 2.0;

uniform float slotms <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 4.0;
	ui_step = 1.0;
	ui_label = "Slot Mask Thickness";
> = 1.0;

uniform float smoothmask <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 2.0;
	ui_step = 0.25;
	ui_label = "Smooth Masks In Bright Scanlines";
> = 0.0;

uniform float smask_mit <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Mitigate Slot Mask Interaction";
> = 0.0;

uniform float bmask <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.25;
	ui_step = 0.01;
	ui_label = "Base (Black) Mask Strength";
> = 0.0;

uniform float mclip <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.025;
	ui_label = "Preserve Mask Strength";
> = 0.0;

uniform float pr_scan <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.025;
	ui_label = "Preserve Scanlines Strength";
> = 0.1;

uniform float maskmid <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.05;
	ui_label = "Mitigate Mask on Mid-Colors";
> = 0.0;

uniform float edgemask <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 0.1;
	ui_label = "Mitigate Mask on Edges";
> = 0.0;

uniform float dctypex <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.75;
	ui_step = 0.05;
	ui_label = "Deconvergence Type X: 0:Static | Other:Dynamic";
> = 0.0;

uniform float dctypey <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 0.75;
	ui_step = 0.05;
	ui_label = "Deconvergence Type Y: 0:Static | Other:Dynamic";
> = 0.0;

uniform float deconrx <
	ui_type = "drag";
	ui_min = -15.0;
	ui_max = 15.0;
	ui_step = 0.25;
	ui_label = "Horizontal Deconvergence 'R' Range";
> = 0.0;

uniform float decongx <
	ui_type = "drag";
	ui_min = -15.0;
	ui_max = 15.0;
	ui_step = 0.25;
	ui_label = "Horizontal Deconvergence 'G' Range";
> = 0.0;

uniform float deconbx <
	ui_type = "drag";
	ui_min = -15.0;
	ui_max = 15.0;
	ui_step = 0.25;
	ui_label = "Horizontal Deconvergence 'B' Range";
> = 0.0;

uniform float deconry <
	ui_type = "drag";
	ui_min = -15.0;
	ui_max = 15.0;
	ui_step = 0.25;
	ui_label = "Vertical Deconvergence 'R' Range";
> = 0.0;

uniform float decongy <
	ui_type = "drag";
	ui_min = -15.0;
	ui_max = 15.0;
	ui_step = 0.25;
	ui_label = "Vertical Deconvergence 'G' Range";
> = 0.0;

uniform float deconby <
	ui_type = "drag";
	ui_min = -15.0;
	ui_max = 15.0;
	ui_step = 0.25;
	ui_label = "Vertical Deconvergence 'B' Range";
> = 0.0;

uniform float decons <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 3.0;
	ui_step = 0.1;
	ui_label = "Deconvergence Strength";
> = 1.0;

uniform float addnoised <
	ui_type = "drag";
	ui_min = -1.0;
	ui_max = 1.0;
	ui_step = 0.02;
	ui_label = "Add Noise";
> = 0.0;

uniform float noiseresd <
	ui_type = "drag";
	ui_min = 1.0;
	ui_max = 10.0;
	ui_step = 1.0;
	ui_label = "Noise Resolution";
> = 2.0;

uniform float noisetype <
	ui_type = "drag";
	ui_min = 0.0;
	ui_max = 1.0;
	ui_step = 1.0;
	ui_label = "Noise Type: Colored | Luma";
> = 0.0;

uniform float post_br <
	ui_type = "drag";
	ui_min = 0.25;
	ui_max = 5.0;
	ui_step = 0.01;
	ui_label = "Post Brightness";
> = 1.0;

#include "ReShade.fxh"

#define TexSize float2(Resolution_X,Resolution_Y)
#define IptSize float2(800.00000000,600.00000000)
#define OptSize float4(BUFFER_SCREEN_SIZE,1.0/BUFFER_SCREEN_SIZE)
#define OrgSize float4(TexSize,1.0/TexSize)
#define SrcSize float4(IptSize,1.0/IptSize)
#define fuxcoord (texcoord*1.00001)
#define scans 1.5*scans
#define eps 1e-10
#define fracoord (fuxcoord*OptSize.xy)
#define texCD(c,d) tex2Dlod(c,float4(d,0,0))

#ifndef Resolution_X
#define Resolution_X 320
#endif

#ifndef Resolution_Y
#define Resolution_Y 240
#endif

#define GADV_S00 ReShade::BackBuffer

texture GADV_T01{Width=Resolution_X;Height=Resolution_Y ;Format=RGBA16F;};
sampler GADV_S01{Texture=GADV_T01;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=POINT ;MinFilter=POINT ;MipFilter=POINT ;};

texture GADV_T02{Width=Resolution_X;Height=Resolution_Y ;Format=RGBA16F;};
sampler GADV_S02{Texture=GADV_T02;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=POINT ;MinFilter=POINT ;MipFilter=POINT ;};

texture GADV_T03{Width=Resolution_X;Height=Resolution_Y ;Format=RGBA16F;};
sampler GADV_S03{Texture=GADV_T03;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=LINEAR;MinFilter=LINEAR;MipFilter=LINEAR;};

texture GADV_T04{Width=Resolution_X;Height=Resolution_Y ;Format=RGBA16F;};
sampler GADV_S04{Texture=GADV_T04;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=LINEAR;MinFilter=LINEAR;MipFilter=LINEAR;};

texture GADV_T05{Width=800.00000000;Height=Resolution_Y ;Format=RGBA16F;};
sampler GADV_S05{Texture=GADV_T05;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=LINEAR;MinFilter=LINEAR;MipFilter=LINEAR;};

texture GADV_T06{Width=800.00000000;Height=600.00000000 ;Format=RGBA16F;};
sampler GADV_S06{Texture=GADV_T06;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=LINEAR;MinFilter=LINEAR;MipFilter=LINEAR;};

texture GADV_T07{Width=800.00000000;Height=600.00000000 ;Format=RGBA16F;};
sampler GADV_S07{Texture=GADV_T07;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=LINEAR;MinFilter=LINEAR;MipFilter=LINEAR;};

texture GADV_T08{Width=800.00000000;Height=600.00000000 ;Format=RGBA16F;};
sampler GADV_S08{Texture=GADV_T08;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=LINEAR;MinFilter=LINEAR;MipFilter=LINEAR;};

texture GADV_T09{Width=BUFFER_WIDTH;Height=BUFFER_HEIGHT;Format=RGBA16F;};
sampler GADV_S09{Texture=GADV_T09;AddressU=BORDER;AddressV=BORDER;AddressW=BORDER;MagFilter=LINEAR;MinFilter=LINEAR;MipFilter=LINEAR;};

texture GADV_001<source="CRT-LUT-1.png";>{Width=1024;Height=32;};
sampler GADV_L01{Texture=GADV_001;};

texture GADV_002<source="CRT-LUT-2.png";>{Width=1024;Height=32;};
sampler GADV_L02{Texture=GADV_002;};

texture GADV_003<source="CRT-LUT-3.png";>{Width=1024;Height=32;};
sampler GADV_L03{Texture=GADV_003;};

texture GADV_004<source="CRT-LUT-4.png";>{Width=1024;Height=32;};
sampler GADV_L04{Texture=GADV_004;};

uniform int framecount<source="framecount";>;

float3 fix_lut(float3 lut,float3 ref)
{
	float r=length(ref);
	float l=length(lut);
	float m=max(max(ref.r,ref.g),ref.b);
	ref=normalize(lut+0.0000001)*lerp(r,l,pow(m,1.25));
	return lerp(lut,ref,LUTBR);
}

float vignette(float2 pos)
{
	float2 b=vigdef*float2(1.0,OrgSize.x/OrgSize.y)*0.125;
	pos=clamp(pos,0.0,1.0);
	pos=abs(2.0*(pos-0.5));
	float2 res=lerp(0.0.xx,1.0.xx,smoothstep(1.0.xx,1.0.xx-b,sqrt(pos)));
	res=pow(res,0.70.xx);
	return max(lerp(1.0,sqrt(res.x*res.y),vigstr),0.0);
}

float contrast(float x)
{
	return max(lerp(x,smoothstep(0,1.0,x),contra),0.0);
}

float dist(float3 A,float3 B)
{
	float r=0.5*(A.r+B.r);
	float3 d=A-B;
	float3 c=float3(2.+r,4.,3.-r);
	return sqrt(dot(c*d,d))/3.;
}

float3 plant(float3 tar,float r)
{
	float t=max(max(tar.r,tar.g),tar.b)+0.00001;
	return tar*r/t;
}

float3 fetch_pixel(float2 coord)
{
	float2 dx=float2(OrgSize.z,0.0)*downsample_levelx;
	float2 dy=float2(0.0,OrgSize.w)*downsample_levely;
	float2 d1=dx+dy;
	float2 d2=dx-dy;
	float sum=15.0;
	float3 result=
	3.0*texCD(GADV_S02,coord   ).rgb+2.0*texCD(GADV_S02,coord+dx).rgb+2.0*texCD(GADV_S02,coord-dx).rgb+
	2.0*texCD(GADV_S02,coord+dy).rgb+2.0*texCD(GADV_S02,coord-dy).rgb+    texCD(GADV_S02,coord+d1).rgb+
		texCD(GADV_S02,coord-d1).rgb+    texCD(GADV_S02,coord+d2).rgb+    texCD(GADV_S02,coord-d2).rgb;
	return result/sum;
}

float gauss_h(float x)
{
	float sigma=1.0/(2.0*SIGMA_H*SIGMA_H);
	return exp(-x*x*sigma);
}

float gauss_v(float x)
{
	float sigma=1.0/(2.0*SIGMA_V*SIGMA_V);
	return exp(-x*x*sigma);
}

float bloom_h(float x)
{
	float sigma=1.0/(2.0*SIGMA_X*SIGMA_X);
	return exp(-x*x*sigma);
}

float bloom_v(float x)
{
	float sigma=1.0/(2.0*SIGMA_Y*SIGMA_Y);
	return exp(-x*x*sigma);
}

float mod(float x,float y)
{
	return x-y* floor(x/y);
}

float st0(float x)
{
	return exp2(-10.0*x*x);
}

float3 sw0(float x,float color,float scanline,float3 c)
{
	float3 xe=lerp(1.0.xxx+scans,1.0.xxx,c);
	float tmp=lerp(beam_min,beam_max,color);
	float ex=x*tmp;
	ex=(gsl>-0.5)?ex*ex:lerp(ex*ex,ex*ex*ex,0.4);
	return exp2(-scanline*ex*xe);
}

float3 sw1(float x,float color,float scanline,float3 c)
{
	float3 xe=lerp(1.0.xxx+scans,1.0.xxx,c);
	x=lerp(x,beam_min*x,max(x-0.4*color,0.0));
	float tmp=lerp(1.2*beam_min,beam_max,color);
	float ex=x*tmp;
	return exp2(-scanline*ex*ex*xe);
}

float3 sw2(float x,float color,float scanline,float3 c)
{
	float3 xe=lerp(1.0.xxx+scans,1.0.xxx,c);
	float tmp=lerp((2.5-0.5*color)*beam_min,beam_max,color);
	tmp=lerp(beam_max,tmp,pow(x,color+0.3));
	float ex=x*tmp;
	return exp2(-scanline*ex*ex*xe);
}

float2 overscan(float2 pos,float dx,float dy)
{
	pos=pos*2.0-1.0;
	pos*=float2(dx,dy);
	return pos*0.5+0.5;
}

float2 warp(float2 pos)
{
	pos=pos*2.0-1.0;
	pos=lerp(pos,float2(pos.x*rsqrt(1.0-c_shape*pos.y*pos.y),pos.y*rsqrt(1.0-c_shape*pos.x*pos.x)),float2(warpx,warpy)/c_shape);
	return pos*0.5+0.5;
}

float3 gc1(float3 c)
{
	float mc=max(max(c.r,c.g),c.b);
	float mg=pow(mc,1.0/gamma_c);
	return c*mg/(mc+eps);
}

float3 crt_mask(float2 pos,float mx,float mb)
{
	float3 mask=mask_drk;
	float3 one=1.0;
	if(shadow_msk== 1.0)
	{
	float mc=1.0-max(maskstr,0.0);
	pos.x=frac(pos.x*0.5);
	if(pos.x<0.49)
	{
	mask.r=1.0;mask.g= mc;mask.b=1.0;
	}else
	{
	mask.r= mc;mask.g=1.0;mask.b= mc;
	}
	}else
	if(shadow_msk== 2.0)
	{
	float lane=mask_lgt;
	float odd=0.0;
	if(frac(pos.x/6.0)<0.49)odd=1.0;
	if(frac((pos.y+odd)/2.0)<0.49)lane=mask_drk;
	pos.x=floor(mod(pos.x,3.0));
	if(pos.x<0.5)mask.r=mask_lgt;else
	if(pos.x<1.5)mask.g=mask_lgt;else
	mask.b= mask_lgt;
	mask*=lane;
	}else
	if(shadow_msk== 3.0)
	{
	pos.x=floor(mod(pos.x,3.0));
	if(pos.x<0.5)mask.r=mask_lgt;else
	if(pos.x<1.5)mask.g=mask_lgt;else
	mask.b= mask_lgt;
	}else
	if(shadow_msk== 4.0)
	{
	pos.x+=pos.y*3.0;
	pos.x=frac(pos.x/6.0);
	if(pos.x<0.3)mask.r=mask_lgt;else
	if(pos.x<0.6)mask.g=mask_lgt;else
	mask.b= mask_lgt;
	}else
	if(shadow_msk== 5.0)
	{
	pos.xy=floor(pos.xy*float2(1.0,0.5));
	pos.x+=pos.y*3.0;
	pos.x=frac(pos.x/6.0);
	if(pos.x<0.3)mask.r=mask_lgt;else
	if(pos.x<0.6)mask.g=mask_lgt;else
	mask.b= mask_lgt;
	}else
	if(shadow_msk== 6.0)
	{
	mask=0.0;
	pos.x=frac(pos.x/2.0);
	if(pos.x<0.49)
	{
	mask.r=1.0;
	mask.b=1.0;
	}else
	mask.g=1.0;
	mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}else
	if(shadow_msk== 7.0)
	{
	mask=0.0;
	pos.x=floor(mod(pos.x,3.0));
	if(pos.x<0.5)mask.r=1.0;else
	if(pos.x<1.5)mask.g=1.0;else
	mask.b=1.0;
	mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}else
	if(shadow_msk== 8.0)
	{
	mask=0.0;
	pos.x=frac(pos.x/2.0);
	if(pos.x<0.49)
	{
	mask=0.0.xxx;
	}else
	mask=1.0.xxx;
	mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}else
	if(shadow_msk== 9.0)
	{
	mask=0.0;
	pos.x=frac(pos.x/3.0);
	if(pos.x<0.3)mask=0.0.xxx;else
	if(pos.x<0.6)mask=1.0.xxx;else
	mask=1.0.xxx;
	mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}else
	if(shadow_msk==10.0)
	{
	mask=0.0;
	pos.x=frac(pos.x/3.0);
	if(pos.x<0.3)mask   =0.0.xxx;else
	if(pos.x<0.6)mask.rb=1.0.xx ;else
	mask.g=1.0;
	mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}else
	if(shadow_msk==11.0)
	{
	mask=0.0;
	pos.x=frac(pos.x*0.25);
	if(pos.x<0.2)mask  =0.0.xxx;else
	if(pos.x<0.4)mask.r=1.0    ;else
	if(pos.x<0.7)mask.g=1.0    ;else
	mask.b=1.0;
	mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}else
	if(shadow_msk==12.0)
	{
	mask=0.0;
	pos.x=frac(pos.x*0.25);
	if(pos.x<0.2)mask.r =1.0   ;else
	if(pos.x<0.4)mask.rg=1.0.xx;else
	if(pos.x<0.7)mask.gb=1.0.xx;else
	mask.b=1.0;mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}else
	if(shadow_msk==13.0)
	{
	mask=0.0;
	pos.x=floor(mod(pos.x,7.0));
	if(pos.x<0.5)mask  =0.0.xxx;else
	if(pos.x<2.5)mask.r=1.0    ;else
	if(pos.x<4.5)mask.g=1.0    ;else
	mask.b=1.0;
	mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}else
	{
	mask=0.0;
	pos.x=floor(mod(pos.x,6.0));
	if(pos.x<0.5)mask    =0.0.xxx;else
	if(pos.x<1.5)mask.r  =1.0    ;else
	if(pos.x<2.5)mask.rg =1.0.xx ;else
	if(pos.x<3.5)mask.rgb=1.0.xxx;else
	if(pos.x<4.5)mask.gb =1.0.xx ;else
	mask.b=1.0;
	mask=clamp(lerp(lerp(one,mask,mcut),lerp(one,mask,maskstr),mx),0.0,1.0);
	}
	if(mask_layout>0.5)mask=mask.rbg;
	float maskmin=min(min(mask.r,mask.g),mask.b);
	return (mask-maskmin)*(1.0+(maskboost-1.0)*mb)+maskmin;
}

float slt_mask(float2 pos,float m,float swidth)
{
	if  ((slotmask1+slotmask2)==0.0)return 1.0;else
	{
	pos.y=floor(pos.y/slotms);
	float mlen=swidth*2.0;
	float px=floor( mod(pos.x, 0.99999*mlen));
	float py=floor(frac(pos.y/(2.0*double_slot))*2.0*double_slot);
	float slot_dark=lerp(1.0-slotmask2,1.0-slotmask1,m);
	float slot=1.0;
	if(py==0.0&&px<swidth) slot=slot_dark;else
	if(py==double_slot&&px>=swidth) slot=slot_dark;
	return slot;
	}
}

float humbars(float pos)
{
	if  (barintensity==0.0)return 1.0;else
	{
	pos=(barintensity>=0.0)?pos:(1.0-pos);
	pos=frac(pos+ mod(float(framecount),barspeed)/(barspeed-1.0));
	pos=(barintensity< 0.0)?pos:(1.0-pos);
	return (1.0-barintensity)+barintensity*pos;
	}
}

float corner(float2 pos)
{
	pos=abs(2.0*(pos-0.50));
	float2 aspect=float2(1.0,OptSize.x/OptSize.y);
	float b=bsize*0.05+0.0005;pos.y=pos.y+b*(aspect.y-1.0);
	float2 crn=max(csize.xx,2.0*b+0.0015);
	float2 crp=max(pos-(1.0-crn*aspect),0.0)/aspect;float cd=sqrt(dot(crp,crp));
	pos=max(pos,1.0-crn+cd);
	float res=lerp(1.0,0.0,smoothstep(1.0-b,1.0,sqrt(max(pos.x,pos.y))));
	return pow(res,sborder);
}

float3 declip(float3 c,float b)
{
	float m=max(max(c.r,c.g),c.b);
	if(m>b)c=c*b/m;
	return c;
}

float igc(float mc)
{
	return pow(mc,gamma_c);
}

float3 gc2(float3 c,float w3)
{
	float mc=max(max(c.r,c.g),c.b);
	float p=1.0/(1.0+(gamma_d-1.0)* lerp(0.375,1.0,w3));
	float mg=pow(mc, p );
	return c*mg/(mc+eps);
}

float3 noise(float3 v)
{
	if(addnoised<0.0)v.z=-addnoised;else v.z= mod(v.z,6001.0)/1753.0;
	v =frac(v)+frac(v*1e4)+frac(v*1e-4);
	v+=float3(0.12345,0.6789,0.314159);
	v =frac(v*dot(v,v)*123.456);
	v =frac(v*dot(v,v)*123.456);
	v =frac(v*dot(v,v)*123.456);
	v =frac(v*dot(v,v)*123.456);
	return v;
}

void bring_pixel(inout float3 c,inout float3 b,inout float3 g,float2 coord,float2 boord)
{
	float stepx=OptSize.z;
	float stepy=OptSize.w;
	float2 dx=float2(stepx,0.0);
	float2 dy=float2(0.0,stepy);
	float posx= 2.0*coord.x-1.0;
	float posy= 2.0*coord.y-1.0;
	if(dctypex>0.025)
	{
	posx= sign(posx)*pow(abs(posx),1.05-dctypex);
	dx=posx*dx;
	}
	if(dctypey>0.025)
	{
	posy= sign(posy)*pow(abs(posy),1.05-dctypey);
	dy=posy*dy;
	}
	float2 rc=deconrx*dx+deconry*dy;
	float2 gc=decongx*dx+decongy*dy;
	float2 bc=deconbx*dx+deconby*dy;
	float r1=texCD(GADV_S09,coord+rc).r;
	float g1=texCD(GADV_S09,coord+gc).g;
	float b1=texCD(GADV_S09,coord+bc).b;
	float ds=decons;
	float3 d=float3(r1,g1,b1);
	c=clamp(lerp(c,d,ds),0.0,1.0);
	r1=texCD(GADV_S08,boord+rc).r;
	g1=texCD(GADV_S08,boord+gc).g;
	b1=texCD(GADV_S08,boord+bc).b;
	d=float3(r1,g1,b1);
	b=g=lerp(b,d,min(ds,1.0));
	r1=texCD(GADV_S06,boord+rc).r;
	g1=texCD(GADV_S06,boord+gc).g;
	b1=texCD(GADV_S06,boord+bc).b;
	d=float3(r1,g1,b1);
	g=lerp(g,d,min(ds,1.0));
}

float4 AfterglowPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float2 dx=float2(OrgSize.z,0.0);
	float2 dy=float2(0.0,OrgSize.w);
	float w=1.0;
	float3 color0=texCD(GADV_S00,texcoord   ).rgb;
	float3 color1=texCD(GADV_S00,texcoord-dx).rgb;
	float3 color2=texCD(GADV_S00,texcoord+dx).rgb;
	float3 color3=texCD(GADV_S00,texcoord-dy).rgb;
	float3 color4=texCD(GADV_S00,texcoord+dy).rgb;
	float3 cr=(2.5*color0+color1+color2+color3+color4)/6.5;
	float3 a=texCD(GADV_S01,texcoord).rgb;
	if((color0.r+color0.g+color0.b<5.0/255.0)){w=0.0;}
	float3 result=lerp(max(lerp(cr,a,0.49+float3(PR,PG,PB))-1.25/255.0,0.0),cr,w);
	return float4(result,w);
}

float4 PreShaderPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	const float3x3 File0=float3x3(0.412391, 0.212639,0.019331, 0.357584,0.715169, 0.119195, 0.180481,0.072192,0.950532);
	const float3x3 File1=float3x3(0.430554, 0.222004,0.020182, 0.341550,0.706655, 0.129553, 0.178352,0.071341,0.939322);
	const float3x3 File2=float3x3(0.396686, 0.210299,0.006131, 0.372504,0.713766, 0.115356, 0.181266,0.075936,0.967571);
	const float3x3 File3=float3x3(0.393521, 0.212376,0.018739, 0.365258,0.701060, 0.111934, 0.191677,0.086564,0.958385);
	const float3x3 File4=float3x3(0.392258, 0.209410,0.016061, 0.351135,0.725680, 0.093636, 0.166603,0.064910,0.850324);
	const float3x3 File5=float3x3(0.377923, 0.195679,0.010514, 0.317366,0.722319, 0.097826, 0.207738,0.082002,1.076960);
	const float3x3 ToRGB=float3x3(3.240970,-0.969244,0.055630,-1.537383,1.875968,-0.203977,-0.498611,0.041555,1.056972);
	const float3x3 ToMDN=float3x3(2.791723,-0.894766,0.041678,-1.173165,1.815586,-0.130886,-0.440973,0.032000,1.002034);
	const float3x3 ToDCI=float3x3(2.493497,-0.829489,0.035846,-0.931384,1.762664,-0.076172,-0.402711,0.023625,0.956885);
	const float3x3 ToADB=float3x3(2.041588,-0.969244,0.013444,-0.565007,1.875968,-0.118360,-0.344731,0.041555,1.015175);
	const float3x3 ToREC=float3x3(1.716651,-0.666684,0.017640,-0.355671,1.616481,-0.042771,-0.253366,0.015769,0.942103);
	const float3x3 D65_to_D55=float3x3(0.4850339153,0.2500956126,0.0227359648,0.3488957224,0.6977914447,0.1162985741,0.1302823568,0.0521129427,0.6861537456);
	const float3x3 D65_to_D93=float3x3(0.3412754080,0.1759701322,0.0159972847,0.3646170520,0.7292341040,0.1215390173,0.2369894093,0.0947957637,1.2481442225);
	float4 imgColor=texCD(GADV_S00,texcoord);
	float4 aftrglow=texCD(GADV_S01,texcoord);
	float w=1.0-aftrglow.w;
	float l=length(aftrglow.rgb);
	aftrglow.rgb=AS*w*normalize(pow(aftrglow.rgb+0.01,ST))*l;
	float bp=w*BP/255.0;
	if(sega_fix>0.5) imgColor.rgb=imgColor.rgb*(255.0/239.0);
	imgColor.rgb=min(imgColor.rgb,1.0);
	float3 color=imgColor.rgb;
	if(int(TNTC)==0) {color.rgb=imgColor.rgb;}else
	{
	float lutlow=LUTLOW/255.0;float invs=1.0/32.0;
	float3 lut_ref=imgColor.rgb+lutlow*(1.0-pow(imgColor.rgb,0.333.xxx));
	float lutb=lut_ref.b*(1.0-0.5*invs);
	lut_ref.rg=lut_ref.rg*(1.0-invs)+0.5*invs;
	float tile1=ceil(lutb*(32.0-1.0));
	float tile0=max(tile1-1.0,0.0);
	float f=frac(lutb*(32.0-1.0));if(f==0.0)f=1.0;
	float2 coord1=float2(tile0+lut_ref.r,lut_ref.g)*float2(invs,1.0);
	float2 coord2=float2(tile1+lut_ref.r,lut_ref.g)*float2(invs,1.0);
	float4 color1,color2,res;
	if(int(TNTC)==1)
	{
	color1=texCD(GADV_L01,coord1);
	color2=texCD(GADV_L01,coord2);
	res=lerp(color1,color2,f);
	}else
	if(int(TNTC)==2)
	{
	color1=texCD(GADV_L02,coord1);
	color2=texCD(GADV_L02,coord2);
	res=lerp(color1,color2,f);
	}else
	if(int(TNTC)==3)
	{
	color1=texCD(GADV_L03,coord1);
	color2=texCD(GADV_L03,coord2);
	res=lerp(color1,color2,f);
	}else
	if(int(TNTC)==4)
	{
	color1=texCD(GADV_L04,coord1);
	color2=texCD(GADV_L04,coord2);
	res=lerp(color1,color2,f);
	}
	res.rgb=fix_lut(res.rgb,imgColor.rgb);
	color=lerp(imgColor.rgb,res.rgb,min(TNTC,1.0));
	}
	float3 c=clamp(color,0.0,1.0);
	float3x3 m_o;
	float p;
	if(CS==0.0){p=2.2;m_o=ToRGB;}else
	if(CS==1.0){p=2.2;m_o=ToMDN;}else
	if(CS==2.0){p=2.6;m_o=ToDCI;}else
	if(CS==3.0){p=2.2;m_o=ToADB;}else
	if(CS==4.0){p=2.4;m_o=ToREC;}
	color=pow(c,p);
	float3x3 m_i;
	if(CP==0.0){m_i=File0;}else
	if(CP==1.0){m_i=File1;}else
	if(CP==2.0){m_i=File2;}else
	if(CP==3.0){m_i=File3;}else
	if(CP==4.0){m_i=File4;}else
	if(CP==5.0){m_i=File5;}
	color=mul(color,m_i);
	color=mul(color,m_o);
	color=clamp(color,0.0,1.0);
	color=pow(color,1.0/p);
	if(CP==-1.0)color=c;
	float3 solor1=plant(pow(color,wp_saturation),max(max(color.r,color.g),color.b));
	float luma=dot(color,float3(0.299,0.587,0.114));
	float3 solor2=lerp(luma,color,wp_saturation);
	color=(wp_saturation>1.0)?solor1:solor2;
	color=plant(color,contrast(max(max(color.r,color.g),color.b)));
	p=2.2;
	color=clamp(color,0.0,1.0);
	color=pow(color,p);
	float3 warmer=mul(color,D65_to_D55);
	warmer=mul(warmer,ToRGB);
	float3 cooler=mul(color,D65_to_D93);
	cooler=mul(cooler,ToRGB);
	float m=abs(WP)/100.0;
	float3 comp=(WP<0.0)?cooler:warmer;
	color=lerp(color,comp,m);
	color=pow(max(color,0.0),1.0/p);
	if(BP>-0.5)color=color+aftrglow.rgb+bp;else
	{
	color=max(color+BP/255.0,0.0)/(1.0+BP/255.0*step(-BP/255.0,max(max(color.r,color.g),color.b)))+aftrglow.rgb;
	}
	color=min(color*pre_bb,1.0);
	return float4(color,vignette(texcoord));
}

float4 LuminancePS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float m=max(log2(OrgSize.x),log2(OrgSize.y));
	m=floor(max(m,1.0))-1.0;
	float2 dx=float2(1.0/OrgSize.x,0.0);
	float2 dy=float2(0.0,1.0/OrgSize.y);
	float2 x2=2.0*dx;
	float2 y2=2.0*dy;
	float ltotal=0.0;
	ltotal+=length(tex2Dlod(GADV_S02,float4(float2(0.3,0.3),m,0)).rgb);
	ltotal+=length(tex2Dlod(GADV_S02,float4(float2(0.3,0.7),m,0)).rgb);
	ltotal+=length(tex2Dlod(GADV_S02,float4(float2(0.7,0.3),m,0)).rgb);
	ltotal+=length(tex2Dlod(GADV_S02,float4(float2(0.7,0.7),m,0)).rgb);
	ltotal*=0.25;
	ltotal=pow(0.577350269*ltotal,0.7);
	float lhistory=texCD(GADV_S03,float2(0.5,0.5)).a;
	ltotal=lerp(ltotal,lhistory,lsmooth);
	float3 l1=texCD(GADV_S02,fuxcoord.xy   ).rgb;
	float3 r1=texCD(GADV_S02,fuxcoord.xy+dx).rgb;
	float3 l2=texCD(GADV_S02,fuxcoord.xy-dx).rgb;
	float3 r2=texCD(GADV_S02,fuxcoord.xy+x2).rgb;
	float c1=dist(l2,l1);
	float c2=dist(l1,r1);
	float c3=dist(r2,r1);
	return float4(c1,c2,c3,ltotal);
}

float4 LinearizePS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float3 c1=texCD(GADV_S02,fuxcoord).rgb;
	float3 c2=texCD(GADV_S02,fuxcoord+float2(0.0,OrgSize.w)).rgb;
	if((downsample_levelx+downsample_levely)>0.025)
	{
	c1=fetch_pixel(fuxcoord);
	c2=fetch_pixel(fuxcoord+float2(0.0,OrgSize.w));
	}
	float3 c=c1;
	float intera=1.0;
	float gamma_in=gamma_i;
	float m1=max(max(c1.r,c1.g),c1.b);
	float m2=max(max(c2.r,c2.g),c2.b);
	float3 df=abs(c1-c2);
	float d=max(max(df.r,df.g),df.b);
	if(interm==2.0) d=lerp(0.1*d,10.0*d,step(m1/(m2+0.0001),m2/(m1+0.0001)));
	float r=m1;
	float yres_div=1.0;if(intres>1.25)yres_div=intres;
	bool hscans=(hiscan>0.5);
	if(interr<=OrgSize.y/yres_div&&interm>0.5&&intres!=1.0&&intres!=0.5&&vga_mode<0.5||hscans)
	{
	intera=0.25;
	float liine_no=floor( mod(OrgSize.y*fuxcoord.y,2.0));
	float frame_no=floor( mod(float(framecount),2.0));
	float ii=abs(liine_no-frame_no);
	if(interm< 3.5)
	{
	c2=plant(lerp(c2,c2*c2,iscans),max(max(c2.r,c2.g),c2.b));
	r=max(m1*ii,(1.0-iscanb)*min(m1,m2));
	c=plant(lerp(lerp(c1,c2,min(lerp(m1,1.0-m2,min(m1,1.0-m1))/(d+0.00001),1.0)),c1,ii),r);
	if(interm==3.0) c=(1.0-0.5*iscanb)*lerp(c2,c1,ii);
	}
	if(interm==4.0){c=plant(lerp(c,c*c,0.5*iscans),max(max(c.r,c.g),c.b))*(1.0-0.5*iscanb);
	}
	if(interm==5.0){c=lerp(c2,c1,0.5);c=plant(lerp(c,c*c,0.5*iscans),max(max(c.r,c.g),c.b))*(1.0-0.5*iscanb);
	}
	if(hscans)c=c1;
	}
	if(vga_mode>0.5)
	{
	c=c1; if(interr<=OrgSize.y)intera=0.75; else intera=0.5;
	}
	c=pow(c,gamma_in);
	if(fuxcoord.x>0.5)gamma_in=intera;else gamma_in=1.0/gamma_in;
	return float4(c,gamma_in);
}

float4 HGaussianPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float FINE_GAUSS= (FINE_GAUSS>0.5)? FINE_GAUSS: lerp(0.75,0.50,-FINE_GAUSS);
	float4 AdvSize=float4(OrgSize.x,OrgSize.y,OrgSize.z,OrgSize.w)*float4(FINE_GAUSS,FINE_GAUSS,1.0/FINE_GAUSS,1.0/FINE_GAUSS);
	float f=frac(AdvSize.x*texcoord.x);
	f=0.5-f;
	float2 tex=floor(AdvSize.xy*texcoord)*AdvSize.zw+0.5*AdvSize.zw;
	float3 color=0.0;
	float2 dx=float2(AdvSize.z ,0.0);
	float3 pixel;
	float w;
	float wsum=0.0;
	float n=-SIZEH;
	do
	{
	pixel=texCD(GADV_S04,tex+n*dx).rgb;
	if(m_glow>0.5)
	{
	pixel=max(pixel-m_glow_cutoff,0.0);
	pixel=plant(pixel,max(max(max(pixel.r,pixel.g),pixel.b)-m_glow_cutoff,0.0));
	}
	w=gauss_h(n+f);
	color=color+w*pixel;
	wsum=wsum+w;
	n=n+1.0;
	}
	while(n<=SIZEH);
	color=color/wsum;
	return float4(color,1.0);
}

float4 VGaussianPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float FINE_GAUSS= (FINE_GAUSS>0.5)? FINE_GAUSS: lerp(0.75,0.50,-FINE_GAUSS);
	float4 AdvSize=float4(SrcSize.x,OrgSize.y,SrcSize.z,OrgSize.w)*float4(FINE_GAUSS,FINE_GAUSS,1.0/FINE_GAUSS,1.0/FINE_GAUSS);
	float f=frac(AdvSize.y*texcoord.y);
	f=0.5-f;
	float2 tex=floor(AdvSize.xy*texcoord)*AdvSize.zw+0.5*AdvSize.zw;
	float3 color=0.0;
	float2 dy=float2(0.0,AdvSize.w );
	float3 pixel;
	float w;
	float wsum=0.0;
	float n=-SIZEV;
	do
	{
	pixel=texCD(GADV_S05,tex+n*dy).rgb;
	w=gauss_v(n+f);
	color=color+w*pixel;
	wsum=wsum+w;
	n=n+1.0;
	}
	while(n<=SIZEV);
	color=color/wsum;
	return float4(color,1.0);
}

float4 BloomHorzPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float FINE_BLOOM= (FINE_BLOOM>0.5)? FINE_BLOOM: lerp(0.75,0.50,-FINE_BLOOM);
	float4 AdvSize=float4(OrgSize.x,OrgSize.y,OrgSize.z,OrgSize.w)*float4(FINE_BLOOM,FINE_BLOOM,1.0/FINE_BLOOM,1.0/FINE_BLOOM);
	float f=frac(AdvSize.x*texcoord.x);
	f=0.5-f;
	float2 tex=floor(AdvSize.xy*texcoord)*AdvSize.zw+0.5*AdvSize.zw;
	float4 color=0.0;
	float2 dx=float2(AdvSize.z ,0.0);
	float4 pixel;
	float w;
	float wsum=0.0;
	float n=-SIZEX;
	do
	{
	pixel=texCD(GADV_S04,tex+n*dx);
	w=bloom_h(n+f);
	pixel.a =max(max(pixel.r,pixel.g),pixel.b);
	pixel.a*=pixel.a*pixel.a;
	color=color+w*pixel;
	wsum=wsum+w;
	n=n+1.0;
	}
	while(n<=SIZEX);
	color=color/wsum;
	return float4(color.rgb,pow(color.a,0.333333));
}

float4 BloomVertPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float FINE_BLOOM= (FINE_BLOOM>0.5)? FINE_BLOOM: lerp(0.75,0.50,-FINE_BLOOM);
	float4 AdvSize=float4(SrcSize.x,OrgSize.y,SrcSize.z,OrgSize.w)*float4(FINE_BLOOM,FINE_BLOOM,1.0/FINE_BLOOM,1.0/FINE_BLOOM);
	float f=frac(AdvSize.y*texcoord.y);
	f=0.5-f;
	float2 tex=floor(AdvSize.xy*texcoord)*AdvSize.zw+0.5*AdvSize.zw;
	float4 color=0.0;
	float2 dy=float2(0.0,AdvSize.w );
	float4 pixel;
	float w;
	float wsum=0.0;
	float n=-SIZEY;
	do
	{
	pixel=texCD(GADV_S07,tex+n*dy);
	w=bloom_v(n+f);
	pixel.a*=pixel.a*pixel.a;
	color=color+w*pixel;
	wsum=wsum+w;
	n=n+1.0;
	}
	while(n<=SIZEY);
	color=color/wsum;
	return float4(color.rgb,pow(color.a,0.175000));
}

float4 Advanced_PS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float gamma_in=1.0/texCD(GADV_S04,float2(0.25,0.25)).a;
	float lum=texCD(GADV_S03,float2(0.5,0.5)).a;
	float intera=texCD(GADV_S04,float2(0.75,0.25)).a;
	bool hscans=(hiscan>0.5);
	bool interb=(((intera<0.35)||(no_scanlines>0.025))&&!hscans);
	bool notate=(TATE<0.5);
	bool vgascan=((abs(intera-0.5)<0.05)&&(no_scanlines==0.0));
	float4 AdvSize= OrgSize*lerp(1.00,1.00,TATE);
	float SourceY=lerp(AdvSize.y,AdvSize.x,TATE);
	float sy=1.0;
	if( intres==1.0)sy=max(round(SourceY/224.0),1.0);
	if( intres>0.25&&intres!=1.0)sy=intres;
	if(vgascan)sy=0.5;else if(abs(intera-0.75)<0.05)sy=1.0;
	if( notate)AdvSize*=float4(1.0,1.0/sy,1.0,sy);else AdvSize*=float4(1.0/sy,1.0,sy,1.0);
	float2 lexcoord=fuxcoord.xy;
	if(IOS> 0.0&& !interb)
	{
	float2 ofactor= OptSize.xy/OrgSize.xy;
	float2 ifactor=(IOS<2.5)? floor(ofactor):ceil(ofactor);
	float2 diff=ofactor/ifactor;
	float scan = lerp(diff.y,diff.x,TATE);
	lexcoord=overscan(lexcoord,scan,scan);
	if(IOS==1.0||IOS==3.0) lexcoord=lerp(float2(fuxcoord.x,lexcoord.y),float2(lexcoord.x,fuxcoord.y),TATE);
	}
	float factor=1.0+(1.0-0.5*OS)*blm_2/100.0-lum*blm_2/100.0;
	lexcoord=overscan(lexcoord,factor,factor);
	lexcoord=overscan(lexcoord,(OrgSize.x-overscanx)/OrgSize.x,(OrgSize.y-overscany)/OrgSize.y);
	float2 pos = warp(lexcoord);
	bool smarte=(smart_ei>0.01&&notate);
	float2 coffset=0.5;
	float2 ps=AdvSize.zw;
	float2 OGL2Pos=pos*AdvSize.xy-coffset;
	float2 fp=frac(OGL2Pos);
	float2 dx=float2(ps.x,0.0);
	float2 dy=float2(0.0,ps.y);
	float2 x2=2.0*dx;
	float2 y2=2.0*dy;
	float2 offx=dx;
	float2 off2=x2;
	float2 offy=dy;
	float fpx=fp.x;
	if(!notate){offx=dy;off2=y2;offy=dx;fpx=fp.y;}
	float f=(notate)?fp.y:fp.x;
	float2 pC4=floor(OGL2Pos)*ps+0.5*ps;
	if((intres==0.5&& notate<1.5)|| vgascan          )pC4.y=floor(pC4.y*OrgSize.y)*OrgSize.w+0.5*OrgSize.w;
	if((intres==0.5&&!notate<1.5)||(vgascan&&!notate))pC4.x=floor(pC4.x*OrgSize.x)*OrgSize.z+0.5*OrgSize.z;
	if( interb&&no_scanlines<0.025&&!hscans) pC4.y=pos.y;else
	if( interb)pC4.y=pC4.y+smoothstep(0.40-0.5*no_scanlines,0.60+0.5*no_scanlines,f)*lerp(AdvSize.w,AdvSize.z,TATE);
	if( hscans)pC4=lerp(float2(pC4.x,pos.y),float2(pos.x,pC4.y),TATE);
	float zero=exp2(-h_sharp);
	float idiv=clamp(lerp(AdvSize.x,AdvSize.y,TATE)/400.0,1.0,2.0);
	float fdivider=max(min(lerp(1.0,1.0,TATE),2.0),idiv*float(interb)); fdivider=1.0/max(fdivider,1.0);
	float wl3=(2.0+fpx)*fdivider;
	float wl2=(1.0+fpx)*fdivider;
	float wl1=(    fpx)*fdivider;
	float wr1=(1.0-fpx)*fdivider;
	float wr2=(2.0-fpx)*fdivider;
	float wr3=(3.0-fpx)*fdivider;
	wl3*=wl3;wl3=exp2(-h_sharp*wl3);
	wl2*=wl2;wl2=exp2(-h_sharp*wl2);
	wl1*=wl1;wl1=exp2(-h_sharp*wl1);
	wr1*=wr1;wr1=exp2(-h_sharp*wr1);
	wr2*=wr2;wr2=exp2(-h_sharp*wr2);
	wr3*=wr3;wr3=exp2(-h_sharp*wr3);
	float sharp1=s_sharp*zero;
	float fp1=1.-fpx;
	float twl3=max(wl3-sharp1, 0.0 );
	float twl2=max(wl2-sharp1,lerp(-0.12,0.0,1.0-fp1*fp1));
	float twl1=max(wl1-sharp1,-0.12);
	float twr1=max(wr1-sharp1,-0.12);
	float twr2=max(wr2-sharp1,lerp(-0.12,0.0,1.0-fpx*fpx));
	float twr3=max(wr3-sharp1, 0.0 );
	bool sharp=(sharp1>0.0);
	float3 c1,c2;
	if( smarte)
	{
	twl3=0.0;twr3=0.0;
	c1=texCD(GADV_S03,pC4          ).xyz;
	c2=texCD(GADV_S03,pC4+offy     ).xyz;
	c1=max(c1-sth,0.0);
	c2=max(c2-sth,0.0);
	}
	float3 l3,l2,l1,r1,r2,r3,color1,color2,colmin,colmax;
	l3=texCD(GADV_S04,pC4-off2     ).rgb;
	l2=texCD(GADV_S04,pC4-offx     ).rgb;
	l1=texCD(GADV_S04,pC4          ).rgb;
	r1=texCD(GADV_S04,pC4+offx     ).rgb;
	r2=texCD(GADV_S04,pC4+off2     ).rgb;
	r3=texCD(GADV_S04,pC4+offx+off2).rgb;
	colmin=min(min(l1,r1),min(l2,r2));
	colmax=max(max(l1,r1),max(l2,r2));
	if( smarte)
	{
	float pc=min(smart_ei*c1.y,ei_limit);
	float pl=min(smart_ei*max(c1.y,c1.x),ei_limit);
	float pr=min(smart_ei*max(c1.y,c1.z),ei_limit);
	twl1=max(wl1-pc,0.01*wl1);twr1=max(wr1-pc,0.01*wr1);
	twl2=max(wl2-pl,0.01*wl2);twr2=max(wr2-pr,0.01*wr2);
	}
	color1=(l3*twl3+l2*twl2+l1*twl1+r1*twr1+r2*twr2+r3*twr3)/(twl3+twl2+twl1+twr1+twr2+twr3);
	if(sharp)color1=clamp(lerp(clamp(color1,colmin,colmax),color1, ring),0.0,1.0);
	float ts=0.025;
	float3 luma=float3(0.2126,0.7152,0.0722);
	float lm2=max(max(l2.r,l2.g),l2.b);
	float lm1=max(max(l1.r,l1.g),l1.b);
	float rm1=max(max(r1.r,r1.g),r1.b);
	float rm2=max(max(r2.r,r2.g),r2.b);
	float swl2=max(twl2,0.0)*(dot(l2,luma)+ts);
	float swl1=max(twl1,0.0)*(dot(l1,luma)+ts);
	float swr1=max(twr1,0.0)*(dot(r1,luma)+ts);
	float swr2=max(twr2,0.0)*(dot(r2,luma)+ts);
	float  folor1=(lm2*swl2+lm1*swl1+rm1*swr1+rm2*swr2)/(swl2+swl1+swr1+swr2);
	float3 solor1=clamp(lerp(max(max(color1.r,color1.g),color1.b),folor1,spike),0.0,1.0);
	if(!interb)color1=pow(color1,scangamma/gamma_in);
	float3 solor2;
	if(!interb&&!hscans)
	{
	pC4+=offy;
	if((intres==0.5&& notate<1.5)|| vgascan          )pC4.y=floor((pos.y+0.33*offy.y)*OrgSize.y)*OrgSize.w+0.5*OrgSize.w;
	if((intres==0.5&&!notate<1.5)||(vgascan&&!notate))pC4.x=floor((pos.x+0.33*offy.x)*OrgSize.x)*OrgSize.z+0.5*OrgSize.z;
	l3=texCD(GADV_S04,pC4-off2     ).rgb;
	l2=texCD(GADV_S04,pC4-offx     ).rgb;
	l1=texCD(GADV_S04,pC4          ).rgb;
	r1=texCD(GADV_S04,pC4+offx     ).rgb;
	r2=texCD(GADV_S04,pC4+off2     ).rgb;
	r3=texCD(GADV_S04,pC4+offx+off2).rgb;
	colmin=min(min(l1,r1),min(l2,r2));
	colmax=max(max(l1,r1),max(l2,r2));
	if( smarte)
	{
	float pc=min(smart_ei*c2.y,ei_limit);
	float pl=min(smart_ei*max(c2.y,c2.x),ei_limit);
	float pr=min(smart_ei*max(c2.y,c2.z),ei_limit);
	twl1=max(wl1-pc,0.01*wl1);twr1=max(wr1-pc,0.01*wr1);
	twl2=max(wl2-pl,0.01*wl2);twr2=max(wr2-pr,0.01*wr2);
	}
	color2=(l3*twl3+l2*twl2+l1*twl1+r1*twr1+r2*twr2+r3*twr3)/(twl3+twl2+twl1+twr1+twr2+twr3);
	if(sharp)color2=clamp(lerp(clamp(color2,colmin,colmax),color2, ring),0.0,1.0);
	lm2=max(max(l2.r,l2.g),l2.b);
	lm1=max(max(l1.r,l1.g),l1.b);
	rm1=max(max(r1.r,r1.g),r1.b);
	rm2=max(max(r2.r,r2.g),r2.b);
	swl2=max(twl2,0.0)*(dot(l2,luma)+ts);
	swl1=max(twl1,0.0)*(dot(l1,luma)+ts);
	swr1=max(twr1,0.0)*(dot(r1,luma)+ts);
	swr2=max(twr2,0.0)*(dot(r2,luma)+ts);
	float  folor2=(lm2*swl2+lm1*swl1+rm1*swr1+rm2*swr2)/(swl2+swl1+swr1+swr2);
	solor2=clamp(lerp(max(max(color2.r,color2.g),color2.b),folor2,spike),0.0,1.0);
	color2=pow(color2,scangamma/gamma_in);
	}
	float3 ctmp=color1;float3 stmp=color1;float w3=1.0;float3 color=color1;
	float3 one=1.0;
	if( hscans){color2=color1;solor2=solor1;}
	if(!interb)
	{
	float shape1=lerp(scanline1,scanline2,    f);
	float shape2=lerp(scanline1,scanline2,1.0-f);
	float wt1=st0(    f);
	float wt2=st0(1.0-f);
	float3 color0=color1*wt1+color2*wt2;
	float3 solor0=solor1*wt1+solor2*wt2;
	ctmp = color0/(wt1+wt2);
	stmp = solor0/(wt1+wt2);
	if(abs(rolling_scan)>0.005){color1=ctmp;color2=ctmp;solor1=stmp;solor2=stmp;}
	float3 w1,w2;
	float3 cref1=lerp(stmp,solor1,beam_size);float creff1=pow(max(max(cref1.r,cref1.g),cref1.b),scan_falloff);
	float3 cref2=lerp(stmp,solor2,beam_size);float creff2=pow(max(max(cref2.r,cref2.g),cref2.b),scan_falloff);
	if(tds>0.5){shape1=lerp(scanline2,shape1,creff1);shape2=lerp(scanline2,shape2,creff2);}
	float scanpix=lerp(OrgSize.x/OptSize.x,OrgSize.y/OptSize.y,float(notate));
	float f1=frac(f-rolling_scan*float(framecount)*scanpix);
	float f2=1.0-f1;
	float m1=max(max(color1.r,color1.g),color1.b)+eps;
	float m2=max(max(color2.r,color2.g),color2.b)+eps;
	cref1=color1/m1;
	cref2=color2/m2;
	if(gsl< 0.5)
	{w1=sw0(f1,creff1,shape1,cref1);w2=sw0(f2,creff2,shape2,cref2);}else
	if(gsl==1.0)
	{w1=sw1(f1,creff1,shape1,cref1);w2=sw1(f2,creff2,shape2,cref2);}else
	{w1=sw2(f1,creff1,shape1,cref1);w2=sw2(f2,creff2,shape2,cref2);}
	float3 w3=w1+w2;
	float wf1=max(max(w3.r,w3.g),w3.b);
	if(wf1>1.0){wf1=1.0/wf1;w1*=wf1,w2*=wf1;}
	if(abs(clp)>0.005)
	{
	sy=m1; one=(clp>0.0)?w1:1.0.xxx;
	float sat=1.0001-min(min(cref1.r,cref1.g),cref1.b);
	color1=lerp(color1,plant(pow(color1,0.70.xxx-0.325*sat),sy),pow(sat,0.3333)*one*abs(clp));
	sy=m2; one=(clp>0.0)?w2:1.0.xxx;
	sat=1.0001-min(min(cref2.r,cref2.g),cref2.b);
	color2=lerp(color2,plant(pow(color2,0.70.xxx-0.325*sat),sy),pow(sat,0.3333)*one*abs(clp));
	}
	color=gc1(color1)*w1+gc1(color2)*w2;
	color=min(color,1.0);
	}
	if( interb)
	{
	color=gc1(color1);
	}
	float colmx=max( max(ctmp.r,ctmp.g),ctmp.b);
	if(!interb)color=pow(color,gamma_in/scangamma);
	return float4(color,colmx);
}

float4 ChromaticPS(float4 position:SV_Position,float2 texcoord:TEXCOORD):SV_Target
{
	float gamma_in=1.0/texCD(GADV_S04,float2(0.25,0.25)).a;
	float lum=texCD(GADV_S03,float2(0.5,0.5)).a;
	float intera=texCD(GADV_S04,float2(0.75,0.25)).a;
	bool interb=((intera<0.35||no_scanlines>0.025)&&(hiscan<0.5));
	bool notate=(TATE<0.5);
	float2 lexcoord=fuxcoord.xy;
	if(IOS> 0.0&& !interb)
	{
	float2 ofactor= OptSize.xy/OrgSize.xy;
	float2 ifactor=(IOS<2.5)? floor(ofactor):ceil(ofactor);
	float2 diff=ofactor/ifactor;
	float scan = lerp(diff.y,diff.x,TATE);
	lexcoord=overscan(lexcoord,scan,scan);
	if(IOS==1.0||IOS==3.0) lexcoord=lerp(float2(fuxcoord.x,lexcoord.y),float2(lexcoord.x,fuxcoord.y),TATE);
	}
	float factor=1.0+(1.0-0.5*OS)*blm_2/100.0-lum*blm_2/100.0;
	lexcoord=overscan(lexcoord,factor,factor);
	lexcoord=overscan(lexcoord,(OrgSize.x-overscanx)/OrgSize.x,(OrgSize.y-overscany)/OrgSize.y);
	float2 pos0= warp(fuxcoord);
	float2 pos1= fuxcoord;
	float2 pos = warp(lexcoord);
	float3 color=texCD(GADV_S09,pos1).rgb;
	float3 Bloom=texCD(GADV_S08,pos ).rgb;
	float3 Glow =texCD(GADV_S06,pos ).rgb;
	if((abs(deconrx)+abs(deconry)+abs(decongx)+abs(decongy)+abs(deconbx)+abs(deconby))>0.2) bring_pixel(color,Bloom,Glow,pos1,pos);
	float cm=igc(max(max(color.r,color.g),color.b));
	float mx1=texCD(GADV_S09,pos1   ).a;
	float colmx=max(mx1,cm);
	float w3=min((max((cm-0.0005)*1.0005,0.0)+0.0001)/(colmx+0.0005),1.0);if(interb)w3=1.0;
	float2 dx= lerp(float2(0.001,0.0),float2(0.0,0.001),TATE);
	float mx0=texCD(GADV_S09,pos1-dx).a;
	float mx2=texCD(GADV_S09,pos1+dx).a;
	float mxg=max(max(mx0,mx1),max(mx2,cm));
	float mx=pow(mxg,1.40/gamma_in);
	float cx=pow(colmx,1.40/gamma_in);
	dx=lerp(float2(OrgSize.z,0.0),float2(0.0,OrgSize.w),TATE)*0.25;
	mx0=texCD(GADV_S09,pos1-dx).a;
	mx2=texCD(GADV_S09,pos1+dx).a;
	float mb=(1.0-min(abs(mx0-mx2)/(0.5+mx1),1.0));
	float3 orig1=color;
	float3 one=1.0;
	float3 cmask=one;
	float3 dmask=one;
	float3 emask=one;
	float mwidths[15]={0.0,2.0,3.0,3.0,6.0,6.0,2.4,3.5,2.4,3.25,3.5,4.5,4.25,7.5,6.25};
	float mwidth=mwidths[int(shadow_msk)];
	float mask_compensate=frac(mwidth);
	if(shadow_msk> 0.5)
	{
	float2 maskcoord= fracoord.yx;
	if( notate)maskcoord=maskcoord.yx;
	float2 scoord=maskcoord;
	mwidth=floor(mwidth)*masksize;
	float swidth=mwidth;
	bool zoomed=(abs(mask_zoom)>0.75);
	float mscale=1.0;
	float2 maskcoord0=maskcoord;
	maskcoord.y=floor(maskcoord.y/masksize);
	float mwidth0=max(mwidth+mask_zoom,2.0);
	if( mshift> 0.25)
	{
	float stagg_lvl=1.0; if(frac(mshift)>0.25)stagg_lvl=2.0;
	float next_line=float(floor(mod(maskcoord.y,2.0*stagg_lvl))<stagg_lvl);
	maskcoord0.x=maskcoord0.x+next_line*0.5*mwidth0;
	}
	maskcoord=maskcoord0/masksize;
	if(!zoomed)cmask*=crt_mask(floor(maskcoord),mx,mb);else
	{
	mscale=mwidth0/mwidth;
	float clerp= frac(maskcoord.x/mscale); if( zoom_mask>0.025 )clerp=clamp((1.0+zoom_mask)*clerp-0.5*zoom_mask,0.0,1.0);
	float coord=floor(maskcoord.x/mscale); if(shadow_msk==13.0&&mask_zoom==-2.0)coord=ceil(maskcoord.x/mscale);
	cmask*=lerp(crt_mask(float2(coord,maskcoord.y),mx,mb),crt_mask(float2(coord+1.0,maskcoord.y),mx,mb),clerp);
	}
	if(slotwidth>0.5)swidth=slotwidth;float smask=1.0;
	float sm_offset=0.0;bool bsm_offset=(shadow_msk==1.0||shadow_msk==3.0||shadow_msk==6.0||shadow_msk==7.0||shadow_msk==9.0||shadow_msk==12.0);
	if( zoomed)
	{
	if(mask_layout<0.5&&bsm_offset)sm_offset=1.0;else
	if(bsm_offset)sm_offset=-1.0;
	}
	swidth=round(swidth*mscale);
	smask =slt_mask(scoord+float2(sm_offset,0.0),mx,swidth);
	smask =clamp(smask+lerp(smask_mit,0.0,w3*pow(colmx,0.3)),0.0,1.0);
	emask =cmask;
	cmask*=smask;
	dmask =cmask;
	if(abs(mask_bloom)>0.025)
	{
	float maxbl=max( max(max(Bloom.r,Bloom.g),Bloom.b),mxg);
	maxbl=maxbl*max(lerp(1.0,2-colmx,bloom_dist),0.0);
	if(mask_bloom>0.025) cmask= max(min(cmask +maxbl*mask_bloom,1),cmask); else
	cmask=max(lerp(cmask,cmask*(1.0-0.5*maxbl)+plant(pow( Bloom,0.35.xxx),maxbl),-mask_bloom),cmask);
	}
	color=pow(color,mask_gamma/gamma_in);
	color=color*cmask;
	color=min(color,1.0);
	color=pow(color,gamma_in/mask_gamma);
	cmask=min(cmask,1.0);
	dmask=min(dmask,1.0);
	float mm=max(-2.75*cx*(cx-1.0)-lerp(0.075,0.165,cx),0.0);color=max(color,orig1*maskmid*mm);
	}
	float dark_compensate=lerp(max(clamp(lerp(mcut,maskstr,mx),0.0,1.0)-1.0+ mask_compensate,0.0)+1.0,1.0,mx); if(shadow_msk< 0.5) dark_compensate=1.0;
	float bb=lerp(brightboost1,brightboost2,mx)* dark_compensate; color*=bb;
	float3 Ref=texCD(GADV_S04,pos).rgb;
	float maxb=texCD(GADV_S08,pos).a;
	float vig =texCD(GADV_S02,clamp(pos,0.0+0.5*OrgSize.zw,1.0-0.5*OrgSize.zw)).a;
	float3 bcmask=lerp(one,dmask,b_mask);
	float3 hcmask=lerp(one,dmask,h_mask);
	float3 Bloomy=Bloom;
	if(abs(blm_1)>0.025)
	{
	if(blm_1<-0.01)Bloomy=plant(Bloom,maxb);
	Bloomy= min(Bloomy*(orig1+color),max(0.5*(colmx+orig1-color),0.001*Bloomy));
	Bloomy=0.5*(Bloomy+lerp(Bloomy,lerp(colmx*orig1,Bloomy,0.5),1.0-color));
	Bloomy= bcmask*Bloomy*max(lerp(1.0,2.0-colmx,bloom_dist),0);
	color=pow(pow(color,mask_gamma/gamma_in)+abs(blm_1)*pow( Bloomy,mask_gamma/gamma_in),gamma_in/mask_gamma);
	}
	if(halation> 0.01)
	{
	Bloom= 0.5*(Bloom+Bloom*Bloom);float mbl=max(max(Bloom.r,Bloom.g),Bloom.b);float mxh=0.5*(colmx+colmx*colmx);
	mbl=lerp(lerp(mxh,lerp( mxh,mbl,mbl),colmx),mbl,mb);
	Bloom=plant(Bloom,lerp(sqrt(mbl*mxh),max((mbl-0.15*(1.0-colmx)),0.4*mxh),pow(colmx,0.25)))*lerp(0.425,1.0,colmx);
	Bloom=(3.0-colmx-color)*plant(0.325+orig1/w3,0.5*(1.0+w3))*hcmask*Bloom;
	color=pow(pow(color,mask_gamma/gamma_in)+ halation *pow( Bloom ,mask_gamma/gamma_in),gamma_in/mask_gamma);
	}else
	if(halation<-0.01)
	{
	float mbl=max(max(Bloom.r,Bloom.g),Bloom.b);
	Bloom=plant(Bloom+Ref+orig1+Bloom*Bloom*Bloom,min(mbl*mbl,0.75));
	color=color+2.0*lerp(1.0,w3,0.5*colmx)*hcmask*Bloom*(-halation);
	}
	color=min(color,1.0);
	color=gc2(color,w3 );
	if(smoothmask>0.125){float w4=pow(w3,0.425+0.3*smoothmask);w4=max(w4-0.175*colmx*smoothmask,0.2);color=lerp(min(color/w4,plant(orig1,1.0+0.175*colmx*smoothmask))*w4,color,w4);}
	if(m_glow<0.5)Glow=lerp(Glow,0.25*color,colmx);else
	{
	float3 orig2=plant(orig1+0.001*Ref,1.0); maxb=max(max(Glow.r,Glow.g),Glow.b);
	Bloom=plant(Glow,1.0);Ref=abs(orig2-Bloom);
	mx0=max(max(orig2.r,orig2.g),orig2.b)-min(min(orig2.r,orig2.g),orig2.b);
	mx2=max(max(Bloom.r,Bloom.g),Bloom.b)-min(min(Bloom.r,Bloom.g),Bloom.b);
	Bloom=lerp(maxb*min(Bloom,orig2),lerp(lerp(Glow,max(max(Ref.r,Ref.g),Ref.b)*Glow,max(mx,mx0)),lerp(color,Glow,mx2),max(mx0,mx2)*Ref),min(sqrt((1.10-mx0)*(0.10+mx2)),1.0));
	if(m_glow>1.5)Glow=lerp(0.5*Glow*Glow,Bloom,Bloom);
	Glow=lerp(m_glow_low*Glow,m_glow_high*Bloom,pow(colmx,m_glow_dist/gamma_in));
	}
	if(m_glow<0.5)
	{
	if(glow >=0.0)color=color+0.5*Glow*glow;else color=color+abs(glow)*min(emask*emask,1.0)*Glow;}else
	{
	float3 fmask=clamp(lerp(one,dmask,m_glow_mask),0.0,1.0);
	color=color+abs(glow)*fmask*Glow;
	}
	color=min(color,1.0);
	if(edgemask>0.05)
	{
	mx0=texCD(GADV_S09,pos1-dx).a;mx0=texCD(GADV_S09,pos1-dx*(1.0-0.75*sqrt(mx0))).a;
	mx2=texCD(GADV_S09,pos1+dx).a;mx2=texCD(GADV_S09,pos1+dx*(1.0-0.75*sqrt(mx2))).a;
	float mx3=texCD(GADV_S09,pos1-4.0*dx).a;
	float mx4=texCD(GADV_S09,pos1+4.0*dx).a;
	mx4=max(pow(abs(mx3-mx4),0.55-0.40*cx),min(max(mx3,mx4)/min(0.1+cx,1.0),1.0));
	mb=(1.0-abs(pow(mx0,1.0-0.65*mx2)-pow(mx2,1.0-0.65*mx0)));
	mb=mx4*edgemask*(1.0001-mb*mb);float3 temp=lerp(color,orig1,mb);
	color=max(temp+lerp(3.5*mb*lerp(1.625*temp,temp,cx),0.0.xxx,pow(color,0.75.xxx -0.5*colmx)),color);
	}
	color=color* lerp(1.0,lerp(0.5*(1.0+w3),w3,mx),pr_scan);
	color=min(color,max(orig1,color)*lerp(one,dmask,mclip));
	color=pow(color,1.0/gamma_o);
	float q=0.6*sqrt(max(max(color.r,color.g),color.b))+0.4;
	if(abs(addnoised)>0.01)
	{
	float3 noise0=noise(float3(floor(OptSize.xy*fuxcoord/noiseresd),float(framecount)));
	if(noisetype<0.5)color=lerp(color,noise0,0.25*abs(addnoised)*q);else
	color=min(color* lerp(1.0,1.5*noise0.x,0.5*abs(addnoised)),1.0);
	}
	colmx=max(max(orig1.r,orig1.g),orig1.b);
	color=color+bmask*lerp(emask,0.125*(1.0-colmx)*color,min(20.0*colmx,1.0));
	return float4(color*vig*humbars(lerp(pos.y,pos.x,bardir))*post_br*corner(pos0),1.0);
}

technique CRT_Guest_Advanced
{
	pass Afterglow
	{
	VertexShader=PostProcessVS;
	PixelShader=AfterglowPS;
	RenderTarget=GADV_T01;
	}
	pass PreShader
	{
	VertexShader=PostProcessVS;
	PixelShader=PreShaderPS;
	RenderTarget=GADV_T02;
	}
	pass Luminance
	{
	VertexShader=PostProcessVS;
	PixelShader=LuminancePS;
	RenderTarget=GADV_T03;
	}
	pass Linearize
	{
	VertexShader=PostProcessVS;
	PixelShader=LinearizePS;
	RenderTarget=GADV_T04;
	}
	pass GaussianX
	{
	VertexShader=PostProcessVS;
	PixelShader=HGaussianPS;
	RenderTarget=GADV_T05;
	}
	pass GaussianY
	{
	VertexShader=PostProcessVS;
	PixelShader=VGaussianPS;
	RenderTarget=GADV_T06;
	}
	pass BloomHorz
	{
	VertexShader=PostProcessVS;
	PixelShader=BloomHorzPS;
	RenderTarget=GADV_T07;
	}
	pass BloomVert
	{
	VertexShader=PostProcessVS;
	PixelShader=BloomVertPS;
	RenderTarget=GADV_T08;
	}
	pass Guest_CRT
	{
	VertexShader=PostProcessVS;
	PixelShader=Advanced_PS;
	RenderTarget=GADV_T09;
	}
	pass Chromatic
	{
	VertexShader=PostProcessVS;
	PixelShader=ChromaticPS;
	}
}