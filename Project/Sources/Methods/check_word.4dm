//%attributes = {}
$word:=$1
$limit:=$2
$size:=Length:C16($word)

Case of 
	: ($size#$limit)
		ALERT:C41("You have to populate 12 characters.")
		GOTO OBJECT:C206(*;"cablage")
		
	Else   // Check all characters
		
		For ($a;1;$size)
			If (alphabet.indexOf($word[[$a]])=-1)
				$a:=13
				ALERT:C41("Value must be in the english alphabet letter only.")
				GOTO OBJECT:C206(*;"cablage")
			End if 
		End for 
		
End case 