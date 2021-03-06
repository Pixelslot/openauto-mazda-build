source "$(dirname "$0")/settings.sh"

wget -q https://www.alsa-project.org/files/pub/lib/alsa-lib-1.2.4.tar.bz2
tar xf alsa-lib-1.2.4.tar.bz2
cd alsa-lib-1.2.4 || exit
patch -p1 <../patches/alsa/fix-dlo.patch
./configure --host=arm-mazda-linux-musleabi --with-sysroot="$SYSROOT" --prefix=/usr/ --enable-shared=no --enable-static=yes --without-versioned --disable-aload --disable-mixer --disable-hwdep --disable-rawmidi --disable-seq --disable-alisp --with-libdl=no --disable-topology --disable-python --without-pthread --without-pic
make V=99 -j`nproc`
make install
