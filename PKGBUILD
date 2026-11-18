# Maintainer: 清遥Singal
# Fork of fastcompmgr 0.6.1 by Tycho Kirchner.

pkgname=litecompmgr
pkgver=0.8.0
pkgrel=1
pkgdesc="A lightweight X11 compositor (fork of fastcompmgr) with working fades, fade-out snapshots and rounded corners."
arch=('x86_64')
url="https://github.com/ENTsSoftware/litecompmgr"
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
source=("litecompmgr-$pkgver.tar.gz::https://github.com/ENTsSoftware/litecompmgr/releases/download/v$pkgver/litecompmgr-$pkgver.tar.gz")
b2sums=('4b5d8ab84c1e7b655961db0f9fc17fc191a3708f02f5b6ada0cb9da306eaca36f505396cd3cd0d57e81e4717ccc89c2d9fadebd986766c1e1bfdbd9e771e80b6')

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
