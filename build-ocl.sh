#!/usr/bin/bash

#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

# build ocl-icd in a separate build script because ocl-icd depends on mesa and mesa depends on vulkan
# so here is the logic

# opencl

cd ocl-icd-git && env _compiler=2 makepkg -si && cd ..

cd lib32-ocl-icd-git && env _compiler=2 makepkg -si && cd ..
