//%attributes = {}
C_LONGINT:C283($1)
$limit:=$1
$name:=OBJECT Get name:C1087
$value:=Form:C1466[$name]

If ($value>$limit) | ($value<1)
	ALERT:C41("Value must be between 1 and "+String:C10($limit))
	GOTO OBJECT:C206(*;$name)
End if 


