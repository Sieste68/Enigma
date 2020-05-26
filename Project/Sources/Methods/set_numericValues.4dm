//%attributes = {}
defineKonstants 

For ($a;1;alphabet.length)
	$b:=$a-1
	rotor_1[$b]:=convert_letter2number (rotor_1[$b])
	rotor_2[$b]:=convert_letter2number (rotor_2[$b])
	rotor_3[$b]:=convert_letter2number (rotor_3[$b])
	rotor_4[$b]:=convert_letter2number (rotor_4[$b])
	rotor_5[$b]:=convert_letter2number (rotor_5[$b])
	ref_A[$b]:=convert_letter2number (ref_A[$b])
	ref_B[$b]:=convert_letter2number (ref_B[$b])
End for 