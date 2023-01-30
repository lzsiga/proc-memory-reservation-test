# Makefile

PLATFORM  := $(shell uname)

PROC      := ${ORACLE_HOME}/bin/proc
PROCFLAGS := sqlcheck=semantics code=ansi lines=yes

CPPFLAGS  := -I${ORACLE_HOME}/precomp/public
CFLAGS    := -g -W -Wall -pedantic -Wno-missing-field-initializers
LDFLAGS   := -g -L${ORACLE_HOME}/lib
LDLIBS    := -lclntsh

ifeq ($(PLATFORM),AIX)
  CFLAGS  += -maix64
  LDFLAGS += -main64
else
  CFLAGS  += -m64
  LDFLAGS += -m64
endif

%.c: %.pc
	${PROC} ${PROCFLAGS} iname=$*.pc
	rm -f $*.lis 2>/dev/null || true
