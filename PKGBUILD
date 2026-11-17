# Maintainer: litecompmgr contributors
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
b2sums=('87f5d9df01b9f901fc4acc65903f267c122fc03948d0e795296b746b315399cfc7c06db7a69b76661924ab11bd9cf660e8913a9cb39f2aa074b0fe48e2077166')

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
