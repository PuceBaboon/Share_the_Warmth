
##
##  $Id: Makefile,v 1.7 2013/03/01 11:34:07 cvsusers Exp $
##
##  Makefile for JALV2 programs (=not= for the compiler itself).
##
##  NOTE:- Uses the USB bootloader, so leave "-loader18 -no-fuse"
##         args in place, otherwise you'll overwrite the bootloader
##         code in the PIC low-end memory and will need to use a
##         traditional programmer to recover.
##

TOP = /home/gaijin/PIC/JAL2
TOOLCHAIN = $(TOP)/JALLIB
CC = $(TOOLCHAIN)/compiler/jalv2	## Jallib-v"p"
LIB = $(TOP)/JALLIB/lib
PK2 = /usr/local/bin/pk2cmd -P -J -E -M -R -T -F

## BLDR = -loader18 -no-fuse		## Leave room from 0x00 for bootloader
					## and don't program fuse bits.
BLDR=

TARG = main

$(TARG).hex:	$(TARG).jal bare_board.jal usb_local_defs.jal xport_defs.jal xport.jal \
			d1w.jal ow_globals.jal ow_search.jal ow_perror.jal ow_get_temps.jal
	$(CC) $(BLDR) -s $(LIB) $<

clean:
	rm -f main.cod main.asm main.hex

prog:	$(TARG).hex
	$(PK2) $<

