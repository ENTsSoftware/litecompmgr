# Maintainer: 清遥Singal
# Fork of fastcompmgr 0.6.1 by Tycho Kirchner.
# The local tarball source works for local builds; replace "source" with the
# project's release URL before publishing to the AUR.

pkgname=litecompmgr
pkgver=0.7.0
pkgrel=1
pkgdesc="A lightweight X11 compositor (fork of fastcompmgr) with working fades, fade-out snapshots and rounded corners."
arch=('x86_64')
url="https://github.com/entssoftware/litecompmgr"
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
source=("litecompmgr-$pkgver.tar.gz")
b2sums=('74de5844401ac88051b47f5aaa89971d828a2467f75eb0068ab2b41835bc86cdc687148993c9cc78eff9629b8fadbfc1a86dea4d508a40f1b672c9a332818e0b')

build() {
  cd "$pkgname-$pkgver"
  make -j"$(nproc)"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 litecompmgr -t "$pkgdir/usr/bin"
  install -Dm644 litecompmgr.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
