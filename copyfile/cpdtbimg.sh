rm dtb.img
rm /media/pumpkin/0403-0201/dtb.img
ls -l /media/pumpkin/0403-0201/dtb.img
scp jsh@192.168.1.5:/data/jsh/tmp/s905x_b/out/target/product/stvs9/dtb.img .

cp dtb.img /media/pumpkin/0403-0201/
ls -l /media/pumpkin/0403-0201/dtb.img
umount /media/pumpkin/0403-0201

