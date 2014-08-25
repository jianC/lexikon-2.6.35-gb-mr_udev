if [ -d ../Compiled ]
then
    rm -r ../Compiled
fi

mkdir ../Compiled
mkdir ../Compiled/modules

cores=`grep -c ^processor /proc/cpuinfo`
make mrproper -j$cores
make lexikon_defconfig -j$cores
make -j$cores

# copy files
cp arch/arm/boot/zImage ../Compiled/zImage
for i in $(find . -name "*.ko")
do
    cp $i ../Compiled/modules/
done

printf "\nKernel output located at ../Compiled\n"
