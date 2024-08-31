var read;
read=file_bin_open(currentfile,2)
switch exetarget
 {
 case 1:
 file_bin_seek(read,patchstart[argument0])
 switch patchkind[argument0]
  {
  case 0:
  for(i=patchstart[argument0]; i<=patchend[argument0]; i+=1)
   {
   file_bin_write_byte(read,$90)
   file_bin_seek(read,i+1)
   }
  break

  case 1:
  file_bin_write_byte(read,$01)
  file_bin_seek(read,patchend[argument0])
  file_bin_write_byte(read,$01)
  break

  case 2:
  file_bin_write_byte(read,patchend[argument0])
  break

  case 3:
  var ext;
  ext=show_question
  ("
  This patch applies changes to the game that are intended for practice and/or research use. These are:
  - Displaying the internal speed in place of the countdown timer.
  - Displaying the redirect timer in place of the track time.
  
  Do you wish to proceed?
  ")

  if ext=0
   {
   exit
   }
  file_bin_write_byte(read,$8C)
  file_bin_seek(read,patchend[argument0])
  file_bin_write_byte(read,$0A)
  file_bin_seek(read,$8CB36)
  file_bin_write_byte(read,$96)
  file_bin_seek(read,$8CB37)
  file_bin_write_byte(read,$43)
  file_bin_seek(read,$33E8C)
  file_bin_write_byte(read,$0D)
  file_bin_seek(read,$33E8B)
  file_bin_write_byte(read,$A0)
  break

  case 4:
  file_bin_write_byte(read,$A0)
  file_bin_seek(read,patchend[argument0])
  file_bin_write_byte(read,$3D)
  file_bin_seek(read,$8CB36)
  file_bin_write_byte(read,$C6)
  file_bin_seek(read,$8CB37)
  file_bin_write_byte(read,$42)
  file_bin_seek(read,$33E8C)
  file_bin_write_byte(read,$0A)
  file_bin_seek(read,$33E8B)
  file_bin_write_byte(read,$54)
  break
  
  case 5:
  var cont, cont2;
  cont=get_string
  ("Enter the exact button to be used for pausing a race.
  (to find this, open the controller in the control panel through devices and printers)
  ","")
  file_bin_write_byte(read,$B9)
  file_bin_write_byte(read,real(cont))
  file_bin_write_byte(read,$00)
  file_bin_write_byte(read,$00)
  file_bin_write_byte(read,$00)
  file_bin_write_byte(read,$E8)
  file_bin_write_byte(read,$31)
  file_bin_write_byte(read,$55)
  file_bin_write_byte(read,$FF)
  file_bin_write_byte(read,$FF)
  break
  
  }
 break

 case 2:
 file_bin_seek(read,patchstart[argument0])
 switch patchkind[argument0]
  {
  case 0:
  file_bin_write_byte(read,$13)
  break

  case 1:
  /*switch argument0
   {
   case 1:
   file_bin_write_byte(read,$20)
   file_bin_seek(read,$CF9E9)

   file_bin_write_byte(read,$80)
   file_bin_seek(read,$CF9EA)

   file_bin_write_byte(read,$80)
   file_bin_seek(read,$CF9FE)

   file_bin_write_byte(read,$10)
   file_bin_seek(read,$CFA07)

   file_bin_write_byte(read,$CC)
   file_bin_seek(read,$CFA08)

   file_bin_write_byte(read,$86)
   break
   }*/
  break
  }

 break
 }

file_bin_close(read)
applied=120
