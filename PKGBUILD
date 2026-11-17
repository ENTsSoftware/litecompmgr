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
b2sums=('91f2faf5c9503c03b310510b0ee92ed1ad79c112ecc869a30971172b027c9bacc3a05dac5aa61c0e3b2a927ecf9b008798950e60edfbda7377359abba5695e6e')

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
