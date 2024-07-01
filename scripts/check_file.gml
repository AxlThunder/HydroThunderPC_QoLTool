var a, f, h, j, k;

a=file_bin_open(argument0,2)

f=file_bin_size(a)
global.file=f

j=""

if f=1019904
 {
 exetarget=1
 swap_screen(1)
 currentfile=argument0
 make_backup(argument0)
 }
else if f=3244077
 {
 exetarget=2
 swap_screen(2)
 currentfile=argument0
 make_backup(argument0)
 }
else if f=2239936
 {
 exetarget=3
 swap_screen(3)
 currentfile=argument0
 make_backup(argument0)
 }
else if f=2238208
 {
 exetarget=4
 swap_screen(4)
 currentfile=argument0
 make_backup(argument0)
 }

file_bin_close(a)
