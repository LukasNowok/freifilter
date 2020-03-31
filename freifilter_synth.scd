// (1) add the synth to the Description Lib
(SynthDef(\filterBank_timeDomain, {
	var mittenFrequenzen = \mittenFrequenzen.kr(#[65.41, 73.42, 82.41, 92.5, 103.83, 116.54, 130.81, 146.83, 164.81, 185, 207.65, 233.08, 261.63, 293.66, 329.63, 369.99, 415.3, 466.16, 523.25, 587.33, 659.26, 739.99, 830.61, 932.33, 1046.5, 1174.66, 1318.51, 1479.98, 1661.22, 1864.65, 2093, 2349.32, 2637.02, 2959.96, 3322.44, 3729.31, 4186.01, 4698.64, 5274.04, 5919.91, 6644.87, 7458.62, 8372.02, 9397.27, 10548.08, 11839.82, 13289.75, 14917.24]),
	levels = \levels.kr(#[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]),
	sig;
	sig = BPF.ar(PinkNoise.ar, mittenFrequenzen, 0.125) * levels;
	sig = sig.sum;
	Out.ar(0, sig!2);
}).add)

// (2) start an instance of the synth (it'll be silent before you change the levels array)
x = Synth(\filterBank_timeDomain);

// (3) generate random levels for all 48 filter-bands (evaluate this multiple times to hear the differences)
x.set(\levels, Array.rand(48, 0.001, 1.0))