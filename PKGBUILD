# Maintainer: 清遥Singal
# Fork of fastcompmgr 0.6.1 by Tycho Kirchner.

pkgname=litecompmgr
pkgver=0.7.1
pkgrel=1
pkgdesc="A lightweight X11 compositor (fork of fastcompmgr) with working fades, fade-out snapshots and rounded corners."
arch=('x86_64')
url="https://github.com/ENTsSoftware/litecompmgr"
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
source=("litecompmgr-$pkgver.tar.gz::https://github.com/ENTsSoftware/litecompmgr/releases/download/v$pkgver/litecompmgr-$pkgver.tar.gz")
b2sums=('687bf34a68981cdde2644e0865df4dcd219a8a1dbad061eaf97290bf3184c994e26556cef2761272235e8b4b3b86700170b62d53bee7e357cd1894d1a672c1d1')

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
