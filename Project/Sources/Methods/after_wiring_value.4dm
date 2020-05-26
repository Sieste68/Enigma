//%attributes = {}
C_LONGINT:C283($nouv;$1)
C_COLLECTION:C1488($2)  // liste normalement

$nouv:=$1  // Return the current value by default
$n:=$2.indexOf($nouv)  // Get the indice

If ($n>-1)  // Found
	If ($n%2=0)
		$nouv:=$2[$n+1]
	Else 
		$nouv:=$2[$n-1]
	End if 
End if 

$0:=$nouv