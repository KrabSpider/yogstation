<<<<<<< HEAD
#if !defined(MAP_FILE)

		#define TITLESCREEN "title" //Add an image in misc/fullscreen.dmi, and set this define to the icon_state, to set a custom titlescreen for your map
		#define TITLESCREEN_ALT null

		#define MINETYPE "lavaland"

        #include "map_files\YogStation\yogstation.2.1.3.dmm"
        #include "map_files\generic\z2.dmm"
        #include "map_files\generic\z3.dmm"
        #include "map_files\generic\z4.dmm"
        #include "map_files\generic\lavaland.dmm"
        #include "map_files\generic\z6.dmm"
        #include "map_files\generic\z7.dmm"
        #include "map_files\generic\z8.dmm"
		#include "map_files\generic\z9.dmm"
		#include "map_files\generic\z10.dmm"
		#include "map_files\generic\z11.dmm"

		#define MAP_PATH "map_files/YogStation"
        #define MAP_FILE "yogstation.2.1.3.dmm"
        #define MAP_NAME "Box Station"

		#define MAP_TRANSITION_CONFIG DEFAULT_MAP_TRANSITION_CONFIG

#elif !defined(MAP_OVERRIDE)

	#warn a map has already been included, ignoring /tg/station 2.

#endif
=======
#define FORCE_MAP "_maps/tgstation2.json"
>>>>>>> c5999bcdb3efe2d0133e297717bcbc50cfa022bc
