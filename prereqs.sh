# detect build architecture
ARCH=$(uname -i)

# docker doesn't use sudo
if [ $BUILD_CONTAINER = "YES" ]; then
        SUDO=""
else
        SUDO="sudo"
fi

# install packages
$SUDO apt-get update
$SUDO apt-get install -y --no-install-recommends \
                dialog \
                libglew-dev \
                glew-utils \
                gstreamer1.0-libav \
                gstreamer1.0-nice \
                libgstreamer1.0-dev \
                libgstrtspserver-1.0-dev \
                libglib2.0-dev \
                libsoup2.4-dev \
                libjson-glib-dev \
                python3-pip \
                python3-packaging \
                qtbase5-dev \
                avahi-utils \
                libgstreamer-plugins-base1.0-dev \
                libgstreamer-plugins-good1.0-dev \
                libgstreamer-plugins-bad1.0-dev

# install cython for if numpy gets built by later packages
python3 -m pip install --no-cache-dir --verbose --upgrade --trusted-host files.pythonhosted.org --trusted-host pypi.org Cython

echo "[Pre-build]  Finished CMakePreBuild script"
