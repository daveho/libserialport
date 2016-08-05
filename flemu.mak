# Hard-coded Makefile for libserialport
#
# I honestly don't know what software you need to get libserialport
# to autoconf on Windows, but I'm pretty sure I don't have it.
# So frick it, it's fricking C code, let's just write a fricking
# makefile and be done with it.
# 
# The compiler toolchain I'm using on Windows is the mingw32 one that
# comes with Code::Blocks.  You should be able to run the command
#
#    mingw32-make -f flemu.mak
#
# and it build a working libserialport.a.  Yeah, we're making
# a fricking static library.  Frick yeah.

# libserialport version number info and library version whatnot
# TODO: we could extract this stuff from configure.ac
MAJOR = 0
MINOR = 1
MICRO = 1
CURRENT = 1
REVISION = 0
AGE = 1

# We need perl, use the cygwin one
PERL=c:/cygwin/bin/perl.exe

# Generate the header file
libserialport.h : libserialport.h.in
	$(PERL) mungeheader.pl \
		SP_PACKAGE_VERSION_MAJOR=$(MAJOR) \
		SP_PACKAGE_VERSION_MINOR=$(MINOR) \
		SP_PACKAGE_VERSION_MICRO=$(MICRO) \
		SP_PACKAGE_VERSION_STRING="\"$(MAJOR).$(MINOR).$(MICRO)\"" \
		SP_LIB_VERSION_CURRENT=$(CURRENT) \
		SP_LIB_VERSION_REVISION=$(REVISION) \
		SP_LIB_VERSION_AGE=$(AGE) \
		SP_LIB_VERSION_STRING="\"$(CURRENT).$(REVISION).$(AGE)\"" \
		< libserialport.h.in \
		> libserialport.h
