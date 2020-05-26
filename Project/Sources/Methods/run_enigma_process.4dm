//%attributes = {}
C_COLLECTION:C1488(R1;R2;R3)
C_LONGINT:C283($tour)

  // Choice of the 3 rotors used among the 5
R1:=choose_rotor (Form:C1466.rotor1)
R2:=choose_rotor (Form:C1466.rotor2)
R3:=choose_rotor (Form:C1466.rotor3)

  // Position intiale de chaque rotor
$a:=R1.indexOf(convert_letter2number (Form:C1466.posRotor1))
pos_init_rotor (R1;$a)
$b:=R2.indexOf(convert_letter2number (Form:C1466.posRotor2))
pos_init_rotor (R2;$b)
$c:=R3.indexOf(convert_letter2number (Form:C1466.posRotor3))
pos_init_rotor (R3;$c)

  // Choice of one of two reflectors
$ref:=select_reflector (Form:C1466.reflecteur)

  // Initialization of the cable, message and decoded_message lists
C_COLLECTION:C1488($cables;$message_init;$message_decode)
$cables:=New collection:C1472
$message_init:=New collection:C1472
$message_decode:=New collection:C1472

  // Configuration des cablages de la machine par l'utilisateur
$cables:=start_wiring_configuration 

  // The user enters the message to be decoded
For ($a;1;Length:C16(Form:C1466.message_init))
	$message_init.push(Form:C1466.message_init[[$a]])
End for 

$tour:=0
  // The loop stops when each letter of the message has been coded.
While ($tour<$message_init.length)
	
	  // the different steps are :
	  // - conversion from letter to number
	  // - cables
	  // - first rotor
	  // - second rotor
	  // - third rotor
	  // - reflector
	  // - third rotor
	  // - second rotor
	  // - first rotor
	  // - cables
	  // - decoded letter
	
	  // Rotor 1
	If (($tour%78)<=25)
		$nombre:=convert_letter2number ($message_init[$tour])
		$nouv_1:=after_wiring_value ($nombre;$cables)
		$nouv_2:=passage_in_a_rotor (R1;$nouv_1)
		$nouv_3:=passage_in_a_rotor (R2;$nouv_2)
		$nouv_4:=passage_in_a_rotor (R3;$nouv_3)
		$nouv_5:=passage_in_reflector ($ref;$nouv_4)
		$nouv_6:=inverse_rotor (R3;$nouv_5)
		$nouv_7:=inverse_rotor (R2;$nouv_6)
		$nouv_8:=inverse_rotor (R1;$nouv_7)
		$nouv_9:=after_wiring_value ($nouv_8;$cables)
		$message_decode.push(alphabet[$nouv_9])
		  // Rotor 1 turns one row to the left until it reaches the 26th turn.
		  // => its initial position
		rank_shift (R1)
	End if 
	
	  // Rotor 2
	If (($tour%78)>25) & (($tour%78)<=51)
		rank_shift (R2)
		$nombre:=convert_letter2number ($message_init[$tour])
		$nouv_1:=after_wiring_value ($nombre;$cables)
		$nouv_2:=passage_in_a_rotor (R1;$nouv_1)
		$nouv_3:=passage_in_a_rotor (R2;$nouv_2)
		$nouv_4:=passage_in_a_rotor (R3;$nouv_3)
		$nouv_5:=passage_in_reflector ($ref;$nouv_4)
		$nouv_6:=inverse_rotor (R3;$nouv_5)
		$nouv_7:=inverse_rotor (R2;$nouv_6)
		$nouv_8:=inverse_rotor (R1;$nouv_7)
		$nouv_9:=after_wiring_value ($nouv_8;$cables)
		$message_decode.push(alphabet[$nouv_9])
	End if 
	
	  // Rotor 3
	If (($tour%78)>51) & (($tour%78)<=77)
		rank_shift (R3)
		$nombre:=convert_letter2number ($message_init[$tour])
		$nouv_1:=after_wiring_value ($nombre;$cables)
		$nouv_2:=passage_in_a_rotor (R1;$nouv_1)
		$nouv_3:=passage_in_a_rotor (R2;$nouv_2)
		$nouv_4:=passage_in_a_rotor (R3;$nouv_3)
		$nouv_5:=passage_in_reflector ($ref;$nouv_4)
		$nouv_6:=inverse_rotor (R3;$nouv_5)
		$nouv_7:=inverse_rotor (R2;$nouv_6)
		$nouv_8:=inverse_rotor (R1;$nouv_7)
		$nouv_9:=after_wiring_value ($nouv_8;$cables)
		$message_decode.push(alphabet[$nouv_9])
	End if 
	
	$tour:=$tour+1
	
End while 

Form:C1466.message_decode:=Replace string:C233($message_decode.join(".");".";"")