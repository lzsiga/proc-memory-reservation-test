# Makefile

PLATFORM  := $(shell uname)

ORAINC    := $(foreach I,precomp/public precomp/include,${ORACLE_HOME}/$I)
ORALIB    := ${ORACLE_HOME}/lib
ORABIN    := ${ORACLE_HOME}/bin

PROC      := ${ORABIN}/proc
PROCFLAGS := sqlcheck=semantics code=ansi lines=yes

CPPFLAGS  := $(foreach I,${ORAINC},-I$I)
CFLAGS    := -g -W -Wall -pedantic -Wno-missing-field-initializers
LDFLAGS   := -g -L${ORALIB}
LDLIBS    := -lclntsh

ifeq ($(PLATFORM),AIX)
  CFLAGS  += -maix64
  LDFLAGS += -maix64 -Wl,-blibpath:${ORALIB}:/usr/lib -Wl,-brtl
else
  CFLAGS  += -m64
  LDFLAGS += -m64 -Wl,-rpath=${ORALIB}
endif

ALL := curstest_01

all: ${ALL}

clean:
	rm -f *.o *.c ${ALL} 2>/dev/null || true

.PRECIOUS: %.c

%.c: %.pc
	${PROC} ${PROCFLAGS} iname=$*.pc
	rm -f $*.lis 2>/dev/null || true
