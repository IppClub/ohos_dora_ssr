# Dora SSR - HarmonyOS Port

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![HarmonyOS](https://img.shields.io/badge/HarmonyOS-4.0+-orange.svg)](https://developer.harmonyos.com/)
[![xmake](https://img.shields.io/badge/build-xmake-green.svg)](https://xmake.io/)

This is the **HarmonyOS (OpenHarmony) port** of the **Dora SSR** open-source game engine ([dora-ssr.net](https://dora-ssr.net)). This project adapts the Dora SSR engine to run natively on HarmonyOS devices, providing a different game development platform for the HarmonyOS ecosystem.

## About Dora SSR

Dora SSR is a high-performance game engine that provides:
- **Cross-platform rendering** with BGFX graphics library
- **Efficient sprite and animation system**
- **Built-in physics engine**
- **Audio and input management**
- **Modern C++ architecture**

## Features

- **Native HarmonyOS Support**: Fully adapted for HarmonyOS 4.0+ devices
- **BGFX Graphics Engine**: High-performance cross-platform rendering
- **SDL2 Integration**: Adapted SDL2 for HarmonyOS input and window management
- **Multi-architecture Support**: ARM64 and x86_64 support
- **DevEco Studio Integration**: Seamless development experience

## Prerequisites

### Required Tools

1. **xmake Build System** ([https://xmake.io](https://xmake.io))
   - Cross-platform build tool for C/C++ projects
   - Handles dependency management and compilation

2. **DevEco Studio**
   - Official HarmonyOS development IDE
   - Download from [HarmonyOS Developer Portal](https://developer.harmonyos.com/)

3. **HarmonyOS SDK**
   - API 11+ (HarmonyOS 4.1.0+)
   - Configured in DevEco Studio

## Installation & Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/IppClub/ohos_dora_ssr.git
cd ohos_dora_ssr
```

### Step 2: Build Third-party Dependencies

Navigate to the `3rdParty` directory and build the required libraries:

```bash
cd 3rdParty
make release
```

This command will:
- Build BGFX graphics library for HarmonyOS
- Build BIMG image processing library
- Build BX utility library
- Generate binaries for both ARM64 and x86_64 architectures

### Step 3: Open in DevEco Studio

1. Launch **DevEco Studio**
2. Select **"Open an existing project"**
3. Navigate to the `Dora` directory and open it
4. Wait for the project to sync and index

### Step 4: Build and Run

1. Connect your HarmonyOS device or start the simulator
2. Click the **Run** button in DevEco Studio
3. Select your target device
4. The app will build and install automatically

## Project Structure

```
ohos_dora_ssr/
├── 3rdParty/                 # Third-party dependencies
│   ├── bgfx/                 # BGFX graphics library
│   ├── bimg/                 # Image processing library
│   ├── bx/                   # Utility library
│   ├── SDL2/                 # SDL2 for HarmonyOS
│   └── makefile              # Build script for dependencies
├── Dora/                     # Main HarmonyOS application
│   ├── entry/                # Application entry point
│   ├── AppScope/             # App configuration
│   └── hvigor/               # Build configuration
└── README.md                 # This file
```

## Configuration

### Build Profiles

The project supports multiple build configurations:
- **Debug**: Development builds with debugging symbols
- **Release**: Optimized production builds

### Target Architectures

- **ARM64-v8a**: Primary target for HarmonyOS devices
- **x86_64**: Support for x86 emulators and devices

## Usage

### Basic Development Workflow

1. **Setup**: Follow the installation steps above
2. **Development**: Use DevEco Studio for coding and debugging
3. **Testing**: Run on device or simulator
4. **Building**: Use DevEco Studio's build system

### Key Components

- **SDLAbility.ts**: Main application entry point
- **BGFX Integration**: Graphics rendering system
- **Input Handling**: Touch input
- **Audio System**: Sound and music playback

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow HarmonyOS development best practices
- Maintain compatibility with the original Dora SSR engine
- Test on both ARM64 and x86_64 architectures
- Update documentation for new features

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **OpenHarmony SIG**: SDL2 HarmonyOS port ([ohos_sdl2](https://gitcode.com/openharmony-sig/ohos_sdl2))
- **BGFX Team**: Cross-platform graphics library
- **SDL2 Team**: Multimedia library

## Related Links

- [Dora SSR Official Website](https://dora-ssr.net)
- [HarmonyOS Developer Portal](https://developer.harmonyos.com/)
- [OpenHarmony Project](https://www.openharmony.cn/)
- [xmake Build System](https://xmake.io/)
