//%attributes = {}
C_LONGINT:C283($1)
C_COLLECTION:C1488($rotor;$0)
$rotor:=New collection:C1472

If ($1>0) & ($1<6)
	$var:=Get pointer:C304("rotor_"+String:C10($1))
	$rotor:=($var->).copy()
End if 
$0:=$rotor
