#ifndef __OSD_SDL12__
#define __OSD_SDL12__

#include <SDL/SDL.h>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

#ifdef MIXER
#include <SDL/SDL_mixer.h>
#endif

#ifdef IMAGE
#include <SDL/SDL_image.h>
#endif

#include "lib/sdlgfx/SDL_rotozoom.h"

#include "osd_sdl.h"

#endif

