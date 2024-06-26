FROM ghcr.io/cirruslabs/flutter:latest

ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH=${FLUTTER_HOME}/bin:${PATH}
ENV FLUTTER_ROOT=${FLUTTER_HOME}

ARG TBA_API_KEY

RUN apt-get update && \
    apt-get install -y \
    git \
    unzip \
    xz-utils \
    libglu1-mesa \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p lib/src/providers
RUN echo "class ApiSecrets {" > lib/src/providers/api_secrets.dart && \
    echo "  static const tbaKey = '$TBA_API_KEY';" >> lib/src/providers/api_secrets.dart && \
    echo "}" >> lib/src/providers/api_secrets.dart

WORKDIR /app
COPY . .

RUN dart run build_runner build --delete-conflicting-outputs

RUN flutter config --no-enable-web --no-enable-macos-desktop --no-enable-linux-desktop --no-enable-windows-desktop

RUN flutter config --enable-android --enable-ios
RUN flutter precache --android --ios

RUN yes | flutter doctor --android-licenses

RUN flutter pub get

RUN flutter doctor

ENTRYPOINT ["bash", "-c", "flutter run --release"]
