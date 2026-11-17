PACKAGES = x11 xcomposite xfixes xdamage xrender
LIBS = `pkg-config --libs ${PACKAGES}` -lm
INCS = `pkg-config --cflags ${PACKAGES}`
CFLAGS ?= -O2 -flto -pipe
CFLAGS += -Wall -fno-plt
PREFIX = /usr/local
MANDIR = ${PREFIX}/share/man/man1

OBJS=litecompmgr.o comp_rect.o cm-root.o cm-global.o cm-util.o cm-window.o cm-event.o

.c.o:
	$(CC) $(CFLAGS) $(INCS) -c $*.c

litecompmgr: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

install: litecompmgr
	@mkdir -p "${PREFIX}/bin"
	@cp litecompmgr "${PREFIX}/bin"
	@mkdir -p "${MANDIR}"
	@cp litecompmgr.1 "${MANDIR}"

uninstall:
	@rm -f "${PREFIX}/bin/litecompmgr"
	@rm -f "${MANDIR}/litecompmgr.1"

clean:
	rm -f $(OBJS) litecompmgr

.PHONY: uninstall clean
