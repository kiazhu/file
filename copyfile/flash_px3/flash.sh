echo "#*********************************************************************"
echo "#		plat-rk flash tool. author:zkh"
echo "#*********************************************************************"

IMG=$1

FunCopyImg(){
    if [ "$IMG" == "k" ];then
	scp zkh@192.168.1.8:/work/home/zkh/RK/rk3229_box/kernel/kernel.img .
    elif [ "$IMG" == "s" ];then
	scp zkh@192.168.1.8:/work/home/zkh/RK/rk3229_box/rockdev/Image-px3/system.img .
    elif [ "$IMG" == "b" ];then
	scp zkh@192.168.1.8:/work/home/zkh/RK/rk3229_box/kernel/boot.img .
    fi
}
FunInitUsb(){
    echo "搜索设备中..."
    while true
    do
	TEST=`upgrade_tool SD`
	#echo "upgrade_tool SD:$TEST"
	#echo "返回长度${#TEST}"
	if [ ${#TEST} == 18 ];then
	    echo "开始进入loader模式"
	elif [ ${#TEST} == 20 ];then
	    echo "开始进入loader模式"
	fi
	
	TEST=`upgrade_tool TD`
	#echo "upgrade_tool TD:$TEST"
	#echo "返回长度${#TEST}"
	if [ ${#TEST} == 16 ];then
	    echo "已经进入loader模式,开始烧录"
	    break
	elif [ ${#TEST} == 18 ];then
	    echo "已经进入loader模式,开始烧录"
	    break
	fi

	sleep 1
    done
}
FunFlashImg(){
    if [ "$IMG" == "k" ];then
	upgrade_tool DI -k kernel.img
    elif [ "$IMG" == "s" ];then
	upgrade_tool DI -s system.img
    elif [ "$IMG" == "b" ];then
	upgrade_tool DI -b boot.img
    elif [ "$IMG" == "r" ];then
	upgrade_tool DI resource resource.img
    fi    
    upgrade_tool RD
}

Main(){
    FunCopyImg
    FunInitUsb
    FunFlashImg
}

Main

