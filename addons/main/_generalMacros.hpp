#include "_prefix.hpp"

/* DO NOT EDIT */
/* General Macros */
#define FUNCASSEMBLY(var1,var2,var3) var1##_##var2##_fnc_##var3
#define GVARASSEMBLY(var1,var2,var3) var1##_##var2##_##var3
#define FUNC(FUNCNAME) FUNCASSEMBLY(PREFIX,COMPONENT,FUNCNAME)
#define OCFUNC(OTHERCOMPONENT,FUNCNAME) FUNCASSEMBLY(PREFIX,OTHERCOMPONENT,FUNCNAME)
#define GVAR(GVARNAME) GVARASSEMBLY(PREFIX,COMPONENT,GVARNAME)
#define OCGVAR(OTHERCOMPONENT,GVARNAME) GVARASSEMBLY(PREFIX,OTHERCOMPONENT,GVARNAME)

#define QUOTE(var1) #var1
#define PREFIXQUOTED QUOTE(PREFIX)


