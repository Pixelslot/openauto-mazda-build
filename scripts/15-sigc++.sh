source "$(dirname "$0")/settings.sh"

if [ ! -f "libsigc++-3.2.0.tar.xz" ]; then
    wget -q https://github.com/libsigcplusplus/libsigcplusplus/releases/download/3.2.0/libsigc++-3.2.0.tar.xz
fi

tar xf libsigc++-3.2.0.tar.xz
cd libsigc++-3.2.0 || exit
meson --prefix=/usr/ --libdir=lib --cross-file=../cross_file.txt --default-library=both build .
cd build || exit
ninja
ninja install
