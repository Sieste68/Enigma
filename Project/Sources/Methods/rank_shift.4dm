//%attributes = {}
C_COLLECTION:C1488($1)
C_LONGINT:C283($a)

$a:=$1[25]
$1[25]:=$1[0]

For ($i;1;$1.length-1)
	$1[$i-1]:=$1[$i]
End for 
$1[24]:=$a
