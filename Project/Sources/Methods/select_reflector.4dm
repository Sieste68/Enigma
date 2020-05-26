//%attributes = {}
C_LONGINT:C283($1)
C_COLLECTION:C1488($reflecteur;$0)
$reflecteur:=New collection:C1472

If ($1>0) & ($1<3)
	$var:=Get pointer:C304("ref_"+alphabet[$1-1])
	$reflecteur:=($var->).copy()
End if 

$0:=$reflecteur