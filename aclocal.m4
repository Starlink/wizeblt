dnl AC_TRY_RUN_WITH_OUTPUT(VARIABLE, PROGRAM,)
AC_DEFUN(AC_TRY_RUN_WITH_OUTPUT,
[AC_REQUIRE([AC_PROG_CC])dnl
cat > conftest.$ac_ext <<EOF
[#]line __oline__ "configure"
#include "confdefs.h"
ifelse(AC_LANG(C), CPLUSPLUS, [#ifdef __cplusplus
extern "C" void exit(int);
#endif
])dnl
[$2]
EOF
eval $ac_link
if test -s conftest && (./conftest > ./conftest.stdout; exit) 2>/dev/null; then
   $1=`cat ./conftest.stdout`
else
   $1=""
fi
rm -fr conftest*])

dnl AC_GREP_SYMBOL(VARIABLE, SYMBOL, FILE)
AC_DEFUN(AC_GREP_SYMBOL,
[AC_REQUIRE([AC_PROG_AWK])dnl
cat > conftest.awk <<EOF
[/^# *define *]$2[[ \t]]/ { print [\$][3] }
EOF
$1=`${AWK} -f conftest.awk $3`
rm -rf conftest*])

