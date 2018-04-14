rm boot.img
rm /media/pumpkin/50B6-F941/boot.img
ls -l /media/pumpkin/50B6-F941/boot.img
scp jsh@192.168.1.5:/data/jsh/tmp/s905x_b/out/target/product/stvs9/boot.img .

cp boot.img /media/pumpkin/50B6-F941/
ls -l /media/pumpkin/50B6-F941/boot.img
umount /media/pumpkin/50B6-F941
rm boot.img
