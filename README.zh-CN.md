# Dora SSR - 鸿蒙系统移植版

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![HarmonyOS](https://img.shields.io/badge/HarmonyOS-4.0+-orange.svg)](https://developer.harmonyos.com/)
[![xmake](https://img.shields.io/badge/build-xmake-green.svg)](https://xmake.io/)

这是 **Dora SSR** 开源游戏引擎（[dora-ssr.net](https://dora-ssr.net)）的 **鸿蒙系统（OpenHarmony）移植版**。本项目将 Dora SSR 引擎适配到鸿蒙系统，为鸿蒙生态提供一套不同的原生游戏开发平台。

## 关于 Dora SSR

Dora SSR 是一个高性能的游戏引擎，提供以下功能：
- **跨平台渲染**：基于 BGFX 图形库
- **高效的精灵和动画系统**
- **内置物理引擎**
- **音频和输入管理**
- **现代 C++ 架构**

## 特性

- **原生鸿蒙支持**：完全适配鸿蒙系统 4.0+ 设备
- **BGFX 图形引擎**：高性能跨平台渲染
- **SDL2 集成**：适配鸿蒙系统的 SDL2 输入和窗口管理
- **多架构支持**：支持 ARM64 和 x86_64
- **DevEco Studio 集成**：无缝的开发体验

## 环境要求

### 必需工具

1. **xmake 构建系统** ([https://xmake.io](https://xmake.io))
   - C/C++ 项目的跨平台构建工具
   - 处理依赖管理和编译

2. **DevEco Studio**
   - 官方鸿蒙开发 IDE
   - 从 [鸿蒙开发者门户](https://developer.harmonyos.com/) 下载

3. **鸿蒙 SDK**
   - API 11+（鸿蒙系统 4.1.0+）
   - 在 DevEco Studio 中配置

## 安装和配置

### 第一步：克隆仓库

```bash
git clone https://github.com/IppClub/ohos_dora_ssr.git
cd ohos_dora_ssr
```

### 第二步：构建第三方依赖

进入 `3rdParty` 目录并构建所需的库：

```bash
cd 3rdParty
make release
```

此命令将：
- 为鸿蒙系统构建 BGFX 图形库
- 构建 BIMG 图像处理库
- 构建 BX 工具库
- 为 ARM64 和 x86_64 架构生成二进制文件

### 第三步：在 DevEco Studio 中打开

1. 启动 **DevEco Studio**
2. 选择 **"打开现有项目"**
3. 导航到 `Dora` 目录并打开
4. 等待项目同步和索引

### 第四步：构建和运行

1. 连接您的鸿蒙设备或启动模拟器
2. 在 DevEco Studio 中点击 **运行** 按钮
3. 选择目标设备
4. 应用将自动构建和安装

## 项目结构

```
ohos_dora_ssr/
├── 3rdParty/                 # 第三方依赖
│   ├── bgfx/                 # BGFX 图形库
│   ├── bimg/                 # 图像处理库
│   ├── bx/                   # 工具库
│   ├── SDL2/                 # 鸿蒙系统 SDL2
│   └── makefile              # 依赖构建脚本
├── Dora/                     # 主鸿蒙应用
│   ├── entry/                # 应用入口点
│   ├── AppScope/             # 应用配置
│   └── hvigor/               # 构建配置
└── README.zh-CN.md           # 本文件
```

## 配置

### 构建配置

项目支持多种构建配置：
- **Debug**：带调试符号的开发构建
- **Release**：优化的生产构建

### 目标架构

- **ARM64-v8a**：鸿蒙设备的主要目标
- **x86_64**：支持 x86 模拟器和设备

## 使用方法

### 基本开发流程

1. **设置**：按照上述安装步骤操作
2. **开发**：使用 DevEco Studio 进行编码和调试
3. **测试**：在设备或模拟器上运行
4. **构建**：使用 DevEco Studio 的构建系统

### 实现的关键组件

- **SDLAbility.ts**：主应用入口点
- **BGFX 集成**：图形渲染系统
- **输入处理**：触摸输入
- **音频系统**：声音和音乐播放

## 贡献

我们欢迎贡献！请按照以下步骤：

1. Fork 仓库
2. 创建功能分支（`git checkout -b feature/amazing-feature`）
3. 提交更改（`git commit -m '添加新功能'`）
4. 推送到分支（`git push origin feature/amazing-feature`）
5. 打开 Pull Request

### 开发指南

- 遵循鸿蒙开发最佳实践
- 保持与原始 Dora SSR 引擎的兼容性
- 在 ARM64 和 x86_64 架构上测试
- 为新功能更新文档

## 许可证

本项目采用 MIT 许可证 - 详情请参阅 [LICENSE](LICENSE) 文件。

## 致谢

- **OpenHarmony SIG**：SDL2 鸿蒙移植版（[ohos_sdl2](https://gitcode.com/openharmony-sig/ohos_sdl2)）
- **BGFX 团队**：跨平台图形库
- **SDL2 团队**：多媒体库

## 相关链接

- [Dora SSR 官方网站](https://dora-ssr.net)
- [鸿蒙开发者门户](https://developer.harmonyos.com/)
- [OpenHarmony 项目](https://www.openharmony.cn/)
- [xmake 构建系统](https://xmake.io/)
