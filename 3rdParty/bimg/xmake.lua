set_project("bimg")
set_languages("c11", "cxx17")
add_rules("mode.debug", "mode.release")

-- 公共宏（Makefile 里各 config 都有）
add_defines("__STDC_LIMIT_MACROS", "__STDC_FORMAT_MACROS", "__STDC_CONSTANT_MACROS")

-- 公共包含目录（保持相对路径结构不变）
add_includedirs(
    "../bx/include/compat/linux",
    "include",
	 "3rdparty",
    "3rdparty/astc-encoder/include",
	 "3rdparty/tinyexr/deps/miniz",
    "../bx/include"
)

-- 公共编译标志（等价于 -Wall -Wextra -Wshadow -Wunused-value -Wundef -fPIC 等）
add_cxflags("-Wall", "-Wextra", "-Wshadow", "-Wunused-value", "-Wundef", "-fPIC")
add_cxxflags("-fno-rtti", "-fno-exceptions")

-- Debug/Release 专属宏与优化级别
if is_mode("debug") then
    add_defines("_DEBUG", "BX_CONFIG_DEBUG=1")
    -- 与原 Makefile 一致：debug 也带 -g
    add_cxflags("-g")
else
    add_defines("NDEBUG", "BX_CONFIG_DEBUG=0")
    add_cxflags("-O3", "-g")  -- 原脚本 release 也包含 -g
end

if is_arch("x86_64") then
	set_targetdir("../../Dora/entry/src/main/cpp/3rdParty/bgfx/Lib/x86_64")
elseif is_arch("arm64-v8a") then
	set_targetdir("../../Dora/entry/src/main/cpp/3rdParty/bgfx/Lib/arm64-v8a")
end

-- 目标：静态库（对应 libbimg.a）
target("bimg")
    set_kind("static")  -- 如果想要 .so 改为 "shared"

    -- 源文件：等价于列出的 astcenc_* 与 bimg/src/image*.cpp
    add_files(
        "3rdparty/astc-encoder/source/*.cpp",
        "src/image.cpp",
        "src/image_gnf.cpp"
    )

-- 目标：静态库（对应 libbimg_decode.a）
target("bimg_decode")
    set_kind("static")

    add_files(
		  "3rdparty/tinyexr/deps/miniz/miniz.c",
        "src/image_decode.cpp"
    )
