# SPDX-License-Identifier: BSD-3-Clause
# Copyright(c) 2010-2019 Intel Corporation

#
# exec-env:
#
#   - define EXECENV_CFLAGS variable (overridden by cmdline)
#   - define EXECENV_LDFLAGS variable (overridden by cmdline)
#   - define EXECENV_ASFLAGS variable (overridden by cmdline)
#   - may override any previously defined variable
#
# examples for RTE_EXEC_ENV: linux, freebsd
#
ifeq ($(CONFIG_RTE_BUILD_SHARED_LIB),y)
EXECENV_CFLAGS  = -pthread -fPIC
else
EXECENV_CFLAGS  = -pthread
endif

# include in every library to build
EXECENV_CFLAGS += -I$(RTE_SDK)/lib/librte_eal/freebsd/include

EXECENV_LDFLAGS =
EXECENV_LDLIBS  = -lexecinfo
EXECENV_ASFLAGS =

ifeq ($(CONFIG_RTE_BUILD_SHARED_LIB),y)
EXECENV_LDLIBS += -lgcc_s
endif

# force applications to link with gcc/icc instead of using ld
LINK_USING_CC := 1

BSDMAKE=/usr/bin/make

export EXECENV_CFLAGS EXECENV_LDFLAGS EXECENV_ASFLAGS
