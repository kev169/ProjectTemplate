#ifdef DEBUG
    #define _OBF(x) x
#else
    #define _OBF(x) obfuscate(x, sizeof(x))
#endif
