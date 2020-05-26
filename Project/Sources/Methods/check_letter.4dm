//%attributes = {}
C_TEXT:C284($value;$name)

$name:=OBJECT Get name:C1087
$value:=Form:C1466[$name]

If (alphabet.indexOf($value)=-1)
	ALERT:C41("Value must be in the english alphabet letter only.")
	GOTO OBJECT:C206(*;$name)
End if 