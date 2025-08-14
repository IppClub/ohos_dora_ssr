add_rules("mode.debug", "mode.release")
set_languages("cxx17")

-- 通用编译选项（C/C++）
add_defines("__STDC_LIMIT_MACROS", "__STDC_FORMAT_MACROS", "__STDC_CONSTANT_MACROS")
add_cxxflags("-Wall", "-Wextra", "-ffast-math", "-fomit-frame-pointer", "-Wshadow", "-Wunused-value", "-Wundef", "-fPIC", "-fno-rtti", "-fno-exceptions")

-- 头文件搜索路径（与 Makefile 一致）
add_includedirs("include/compat/linux", "include", "3rdparty")

if is_arch("x86_64") then
	set_targetdir("../../Dora/entry/src/main/cpp/3rdParty/bgfx/Lib/x86_64")
elseif is_arch("arm64-v8a") then
	set_targetdir("../../Dora/entry/src/main/cpp/3rdParty/bgfx/Lib/arm64-v8a")
end

-- 目标：静态库 bx
target("bx")
    set_kind("static")

    -- 源文件（等价于列出的那些 .cpp；用通配更简洁）
    add_files("src/*.cpp")

    -- Debug/Release 差异（BX_CONFIG_DEBUG 宏 / 优化等级）
    on_load(function (target)
        if is_mode("debug") then
            target:add("defines", "BX_CONFIG_DEBUG=1", "_DEBUG")
        else
            target:add("defines", "BX_CONFIG_DEBUG=0", "NDEBUG")
            -- O3 与 Makefile 对齐
            target:add("cxflags", "-O3", {force = true})
        end
    end)
