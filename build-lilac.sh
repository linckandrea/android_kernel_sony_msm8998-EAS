echo
echo "Setup"
echo 

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
make O=out clean
make O=out mrproper

echo
echo "Issue Build Commands"
echo

export CLANG_PATH=/home/andrea/android/proton-clang/bin
export PATH=${CLANG_PATH}:${PATH}
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-

echo
echo "Set DEFCONFIG"
echo 
make CC=clang O=out lineage-msm8998-yoshino-lilac_defconfig

echo
echo "Build The Good Stuff"
echo 

make CC=clang O=out -j$(nproc --all)

echo
echo "Making flashable zip"
echo

echo
echo "Clean up"
echo
rm ./AnyKernel3/lilac/Pop_kernel-poplar-Q-rx-x-EAS.zip
rm ./AnyKernel3/lilac/Image.gz-dtb

echo
echo "copying new files"
echo
cp ./out/arch/arm64/boot/Image.gz-dtb ./AnyKernel3/lilac/
cd ./AnyKernel3/lilac/
zip -r9 Pop_kernel-lilac-Q-rx-x-EAS.zip * -x .git README.md *placeholder
