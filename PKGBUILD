# Maintainer: 清遥Singal
# Fork of fastcompmgr 0.6.1 by Tycho Kirchner.

pkgname=litecompmgr
pkgver=0.7.0
pkgrel=1
pkgdesc="A lightweight X11 compositor (fork of fastcompmgr) with working fades, fade-out snapshots and rounded corners."
arch=('x86_64')
url="https://github.com/ENTsSoftware/litecompmgr"
license=('MIT')
depends=('glibc' 'libx11' 'libxcomposite' 'libxdamage' 'libxfixes' 'libxrender')
source=("litecompmgr-$pkgver.tar.gz::https://github.com/ENTsSoftware/litecompmgr/releases/download/v$pkgver/litecompmgr-$pkgver.tar.gz")
b2sums=('ce79d959331d9b93008514a142904f7fa87690dca6ff20d72993a7aebd130fdf6040b11237fbe6ded6a86aa70fff0555bae1f0b0070db9cb8f7d7d287c9e1cc2')

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
