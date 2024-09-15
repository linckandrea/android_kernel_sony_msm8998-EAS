echo
echo "Setup"
echo 

branch=$(git symbolic-ref --short HEAD)
branch_name=$(git rev-parse --abbrev-ref HEAD)
last_commit=$(git rev-parse --verify --short=8 HEAD)
export LOCALVERSION="-Pop-Kernel-${branch_name}/${last_commit}"

mkdir -p out
export ARCH=arm64
export SUBARCH=arm64
make O=out clean
make O=out mrproper

echo
echo "Set DEFCONFIG"
echo 
make CC=clang O=out lineage-msm8998-yoshino-lilac_defconfig

echo
echo "Issue Build Commands"
echo

PATH=""$HOME"/Android-dev/toolchains/aosp-clang/clang-r522817/bin:"$HOME"/Android-dev/toolchains/aosp-clang/aarch64-linux-android-4.9/bin:"$HOME"/Android-dev/toolchains/aosp-clang/arm-linux-androideabi-4.9/bin:${PATH}" \

echo
echo "Build The Good Stuff"
echo 

make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      SUBARCH=arm64 \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-android- \
                      CROSS_COMPILE_ARM32=arm-linux-androideabi- \
                      HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument" \
                      LLVM=1 \
                      LLVM_IAS=1

echo
echo "Making flashable zip"
echo

echo
echo "Clean up"
echo
rm ./AnyKernel3/lilac/*.zip
rm ./AnyKernel3/lilac/Image.gz-dtb

echo
echo "copying new files"
echo
cp ./out/arch/arm64/boot/Image.gz-dtb ./AnyKernel3/lilac/
cd ./AnyKernel3/lilac/
zip -r9 Pop_kernel-lilac-"$version"-"$branch"-"$last_commit"-EAS.zip * -x .git README.md *placeholder
cd ..
cd ..