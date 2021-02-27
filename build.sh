#!/usr/bin/bash

#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

# spir-v

cd spirv-headers-git && env _compiler=2 makepkg -si && cd ..

cd spirv-cross-git && env _compiler=2 makepkg -si && cd ..

cd spirv-tools-git && env _compiler=2 makepkg -si && cd ..

# glslang

cd glslang-git && env _compiler=2 makepkg -si && cd ..

# vulkan

cd vulkan-headers-git && env _compiler=2 makepkg -si && cd ..

cd vulkan-icd-loader-git && env _compiler=2 makepkg -si && cd ..

cd vulkan-validation-layers-git && makepkg -si && cd ..

cd vulkan-extensionlayers-git && env _compiler=2 makepkg -si && cd ..

cd vulkan-tools-git && env _compiler=2 makepkg -si && cd ..

cd vulkan-lunarg-tools-git && env _compiler=2 makepkg -si && cd ..

# opencl

cd opencl-headers-git && env _compiler=2 makepkg -si && cd ..

cd opencl-clhpp-git && env _compiler=2 makepkg -si && cd ..

# lib32 #

# spirv

cd lib32-spirv-cross-git && env _compiler=2 makepkg -si && cd ..

cd lib32-spirv-tools-git && env _compiler=2 makepkg -si && cd ..

# glslang

cd lib32-glslang-git && env _compiler=2 makepkg -si && cd ..

# vulkan

cd lib32-vulkan-icd-loader-git && env _compiler=2 makepkg -si && cd ..

cd lib32-vulkan-validation-layers-git && makepkg -si && cd ..

cd lib32-vulkan-extensionlayers-git && env _compiler=2 makepkg -si && cd ..

# make a copy of every pkg in package-$(date -I)/ dir

mkdir -p package-$(date -I)

cp -v */package-$(date -I)/*.pkg.tar.zst package-$(date -I)/
cp -v */*.pkg.tar.zst package-$(date -I)/

# clean build dir

rm -rf */src/
rm -rf */pkg/
rm -rf */*/src/
rm -rf */*/pkg/
