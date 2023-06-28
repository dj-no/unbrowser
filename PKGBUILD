# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=unbrowser-git
pkgver=r7.a572bb8
pkgrel=1
pkgdesc="The only browser you will ever need!"
arch=('any')
url="https://github.com/dj-no/unbrowser"
license=('Unlicense')
depends=()
makedepends=(git)
provides=(unbrowser)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$provides"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$provides"
	make
}

package() {
	cd "$provides"
	make DESTDIR="$pkgdir/" install
	install -Dm755 unbrowser.desktop "$pkgdir/usr/share/applications/unbrowser.desktop"
}
