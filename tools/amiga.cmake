# Sample toolchain file for building for Windows from an Ubuntu Linux system.
#
# Typical usage:
#    *) install cross compiler: `sudo apt-get install mingw-w64 g++-mingw-w64`
#    *) cd build
#    *) cmake -DCMAKE_TOOLCHAIN_FILE=~/Toolchain-Ubuntu-mingw64.cmake ..

set(CMAKE_SYSTEM_NAME Amiga)
SET(AMIGA=1)
SET(PLATFORM "AMIGA")
set(TOOLCHAIN_PREFIX m68k-amigaos)

# cross compilers to use for C and C++
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
set(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)

# target environment on the build host system
#   set 1st to dir with the cross compiler's C/C++ headers/libs
set(CMAKE_FIND_ROOT_PATH /opt/${TOOLCHAIN_PREFIX})

# modify default behavior of FIND_XXX() commands to
# search for headers/libs in the target environment and
# search for programs in the build host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#TARGET_LINK_LIBRARIES ("mingw32 SDLmain  SDL SDL_Mixer")
#-mwindows /usr/i686-w64-mingw32/lib/x64/SDL_mixer.lib")
#set ( CMAKE_EXE_LINKER_FLAGS "-lmingw32 -lSDLmain  -lSDL -mwindows")

ADD_DEFINITIONS( -DAMIGAOS -noixemul -I/opt/m68k-amigaos/include -I/opt/m68k-amigaos/vbcc-include -D__NOINLINE__)
#-I${CMAKE_FIND_ROOT_PATH}/include)
#-DGCW_SOFTSTRETCH)	
#-DMIXER) 

set ( CMAKE_EXE_LINKER_FLAGS "-L/opt/m68k-amigaos/lib -Wl,-rpath,/opt/m68k-amigaos/lib -lSDL -lpthread")


SET(OSDEP "src/shared/osdep.c" )

