# litecompmgr

__litecompmgr__ is a lightweight compositor for X11, forked from
[fastcompmgr 0.6.1](https://github.com/tycho-kirchner/fastcompmgr)
(which is based on xcompmgr-dana, xcompmgr and an early version of compton).

It keeps the minimal, single-buffer XRender design of its ancestors and adds
what was missing for everyday desktop use: working window fading, a fade-out
of the last real window contents, anti-aliased rounded corners, and lower
per-frame compositing overhead.

## Features

- **Working fades.** Upstream fastcompmgr ships with `run_fades()` commented
  out (`-f` does nothing). litecompmgr re-enables and fixes the fade state
  machine, including fades on busy event streams.
- **Fade-out keeps the window contents.** A half-resolution ARGB snapshot of
  each window is kept up to date; after the client window is destroyed the
  fade-out still shows the real contents instead of an empty frame.
- **Anti-aliased rounded corners** (`-R radius`, default 8, `0` disables),
  drawn with a half-resolution A8 mask, scaled up with bilinear filtering.
- **Client-side shadows** (`-c`), inactive window opacity (`-i`), frame
  opacity (`-e`) and the other options inherited from fastcompmgr.
- **Low overhead:**
  - damage-driven repaints with damage-region clipping;
  - window border regions are translated on moves and rebuilt only on size
    changes (no per-frame synchronous shape query);
  - the per-frame `XFixesFetchRegion` round-trip is skipped below 9 visible
    windows;
  - paints are merged to at most one per 16 ms, `XFlush` instead of a
    blocking `XSync`;
  - snapshots are refreshed at most once per frame.

## Build

```sh
make
sudo make install
```

Dependencies: libx11, libxcomposite, libxdamage, libxfixes, libxrender
(plus their pkg-config files).

## Usage

```sh
litecompmgr -f -F -I 0.08 -O 0.08 -D 32 -R 8 &
```

Example i3 config line:

```
exec --no-startup-id litecompmgr -f -F -I 0.08 -O 0.08 -D 32 -R 8 &
```

See `man litecompmgr` for all options.

## Known limitations

- No vsync. The compositor uses a single full-screen buffer; syncing it to
  the vertical blank (e.g. via XPresent) was tried and caused flicker, so it
  is not used. Fast drags of large windows may show minor tearing.
- No blur, no window rules (per-class opacity/shadow/corner settings), no
  window animations. Use picom (GLX backend) if you need those.
- Damage-driven paints are merged with a 16 ms interval; this bounds the
  added display latency to one frame. Change `PAINT_MIN_INTERVAL_MS` in
  `litecompmgr.c` to tune it (0 disables merging).
- Fade-out snapshots cost about 1/4 of a window-sized ARGB buffer per visible
  window (half resolution).

## Performance

Upstream fastcompmgr's README reports the following numbers (measured by its
author on a Dell Latitude E5570 with stacked chromium windows):

| Compositor    | move  | resize  | scroll |
| ------------- | ----- | ------- | ------ |
| fastcompmgr   | 6.7%  | 4.4%    | 1.5%   |
| xcompmgr      | 7.8%  | 4.9%    | 1.6%   |
| compton       | 26.4% | 6.8%    | 17.1%  |
| picom         | 29.3% | 8.1%    | 23.1%  |

On top of that, litecompmgr further reduces the CPU cost of scrolling,
moving and fading windows compared to unmodified fastcompmgr (damage,
synchronization and frame-pacing changes listed above).

## Credits

Based on fastcompmgr by Tycho Kirchner, which is based on
xcompmgr (Keith Packard, Dana Jansens) and compton (Christopher Jeffrey).
See LICENSE for the full copyright notices.

## License

MIT. See [LICENSE](LICENSE).
