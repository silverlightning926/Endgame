FROM ghcr.io/cirruslabs/flutter:latest

ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH=${FLUTTER_HOME}/bin:${PATH}
ENV FLUTTER_ROOT=${FLUTTER_HOME}

RUN apt-get update && \
    apt-get install -y \
    git \
    unzip \
    xz-utils \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN flutter config --no-enable-web --no-enable-macos-desktop --no-enable-linux-desktop --no-enable-windows-desktop

RUN flutter config --enable-android --enable-ios
RUN flutter precache --android --ios

RUN yes | flutter doctor --android-licenses

RUN flutter pub get

RUN flutter doctor

ENTRYPOINT ["bash", "-c", "flutter run --release"]

