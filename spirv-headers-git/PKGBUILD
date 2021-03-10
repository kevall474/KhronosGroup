#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Felix Yan <felixonmars@archlinux.org

#######################################

#Set '1' to build with GCC
#Set '2' to build with CLANG
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

#######################################

pkgname=spirv-headers-git
pkgdesc='SPIR-V Headers'
pkgver=1.5.4
pkgrel=1
arch=('x86_64')
url='https://github.com/KhronosGroup/SPIRV-Headers.git'
license=(MIT)
makedepends=('make' 'cmake' 'git' 'extra-cmake-modules' 'clang' 'llvm' 'llvm-libs' 'gcc' 'gcc-libs' 'ninja')
conflicts=('spirv-headers')
provides=('spirv-headers' 'spirv-headers-git')
source=('SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git')
md5sums=('SKIP')

pkgver(){
  cd SPIRV-Headers
  echo 1.5.4.$(date -I | sed 's/-/_/' | sed 's/-/_/').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
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

  cd SPIRV-Headers

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_C_FLAGS=-m64 \
  -DCMAKE_CXX_FLAGS=-m64 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DSPIRV_HEADERS_SKIP_EXAMPLES=ON \
  -DSPIRV_HEADERS_SKIP_INSTALL=OFF \
  -DSPIRV_HEADERS_ENABLE_INSTALL=ON

  ninja -C build
}

package(){
  DESTDIR="$pkgdir" ninja -C SPIRV-Headers/build/ install

  # install licence
  install -Dm644 "${srcdir}"/SPIRV-Headers/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
