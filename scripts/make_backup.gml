var h, k, j;
h=string(argument0)
k=(string_length(h))-3
j=string_copy(h,0,k)
j=string_insert("bak",j,k+1)
if !file_exists(j)
 {
 file_copy(h,j)
 backupmade=120
 }
else
 {
 backupexists=120
 }
