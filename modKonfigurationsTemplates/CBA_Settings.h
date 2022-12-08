/* Medicsystem */
#ifdef RR_MEDICSYSTEM_ARKADE
	#include "\RR_commons_resources\modKonfigurationsTemplates\medicSettings\arkade.h"
#endif
#ifdef RR_MEDICSYSTEM_STANDARD
	#include "\RR_commons_resources\modKonfigurationsTemplates\medicSettings\standard.h"
#endif

/* Logistiksystem */
#ifdef RR_LOGISTIKSYSTEM_STANDARD
	#include "\RR_commons_resources\modKonfigurationsTemplates\logistikSettings\standard.h"
#endif

#ifdef RR_MEDICSYSTEM_IRONPACK
	#include "\RR_commons_resources\modKonfigurationsTemplates\logistikSettings\erweitert.h"
#endif
