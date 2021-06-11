#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Laurent Carlier <lordheavym@gmail.com>

#######################################

#Set '1' to build with GCC
#Set '2' to build with CLANG
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

#######################################

pkgname=vulkan-headers-git
pkgdesc='Vulkan header files (git version)'
pkgver=1.2.180
pkgrel=1
arch=('x86_64')
url='https://github.com/KhronosGroup/Vulkan-Headers'
license=(Apache-2.0)
makedepends=("make" "cmake" "git" "extra-cmake-modules" "python" "clang" "llvm" "llvm-libs" "gcc" "gcc-libs" "ninja")
conflicts=('vulkan-headers')
provides=('vulkan-hpp' 'vulkan-headers' 'vulkan-headers-git')
source=('Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git')
md5sums=('SKIP')

pkgver(){
  cd Vulkan-Headers
  echo 1.2.180.$(date -I | sed 's/-/_/' | sed 's/-/_/').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
if [[ $_compiler = "1" ]]; then
  export CC="gcc"
  export CXX="g++"
elif [[ $_compiler = "2" ]]; then
  export CC="clang"
  export CXX="clang++"
else
  export CC="gcc"
  export CXX="g++"
fi

  cd Vulkan-Headers

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_C_FLAGS=-m64 \
  -DCMAKE_CXX_FLAGS=-m64 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C Vulkan-Headers/build/ install

  # install licence
  install -Dm644 "${srcdir}"/Vulkan-Headers/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
