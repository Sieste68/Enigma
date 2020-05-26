//%attributes = {}
C_COLLECTION:C1488($liste;$0)
$liste:=New collection:C1472
  //$text:=""
  //While (Length($text)#12)
  //$text:=Request("Entrer les 6 paires de lettres reliéess, les saisir dans l'ordre (soit 12 lettres) :")
  //End while 
  //$text:=Uppercase($text)


$text:=Uppercase:C13(Form:C1466.cablage)
For ($a;1;12)
	$liste.push(convert_letter2number ($text[[$a]]))
End for 

$0:=$liste.copy()