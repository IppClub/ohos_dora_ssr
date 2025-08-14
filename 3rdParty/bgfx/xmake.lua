set_project("bgfx")
add_rules("mode.debug", "mode.release")
set_languages("cxx17")

target("bgfx")
	set_kind("static")

	 -- 通用编译参数（对应 -Wall -Wextra -ffast-math -fomit-frame-pointer 等）
	add_cxflags("-Wall", "-Wextra", "-ffast-math", "-fomit-frame-pointer",
				"-Wshadow", "-Wunused-value", "-Wundef")
	add_cflags("-MMD", "-MP")   -- 生成依赖文件，等价 -MMD -MP
	add_cxxflags("-fno-rtti", "-fno-exceptions", "-fPIC")
	 add_defines("BGFX_CONFIG_RENDERER_OPENGLES=30")
	 add_defines("BGFX_CONFIG_RENDERER_OPENGLES_MIN_VERSION=30")

	-- Debug / Release 宏与优化
	if is_mode("debug") then
		add_defines("__STDC_LIMIT_MACROS", "__STDC_FORMAT_MACROS", "__STDC_CONSTANT_MACROS",
					"_DEBUG", "BX_CONFIG_DEBUG=1")
		add_cxflags("-g")
		  
	else
		add_defines("__STDC_LIMIT_MACROS", "__STDC_FORMAT_MACROS", "__STDC_CONSTANT_MACROS",
					"NDEBUG", "BX_CONFIG_DEBUG=0")
		add_cxflags("-g", "-O3")
	end

	if is_arch("x86_64") then
		set_targetdir("../../Dora/entry/src/main/cpp/3rdParty/bgfx/Lib/x86_64")
	elseif is_arch("arm64-v8a") then
		set_targetdir("../../Dora/entry/src/main/cpp/3rdParty/bgfx/Lib/arm64-v8a")
	end

	-- 包含路径（按原 Makefile）
	add_includedirs(
		"../bx/include/compat/linux",
		"3rdparty",
		"../bimg/include",
		"../bx/include",
		"3rdparty/khronos",
		"include"
	)

	-- 源文件（与 OBJECTS 列表一致）
	add_files(
		"src/bgfx.cpp",
		"src/debug_renderdoc.cpp",
		"src/dxgi.cpp",
		"src/glcontext_egl.cpp",
		"src/glcontext_html5.cpp",
		"src/glcontext_wgl.cpp",
		"src/nvapi.cpp",
		"src/renderer_agc.cpp",
		"src/renderer_d3d11.cpp",
		"src/renderer_d3d12.cpp",
		"src/renderer_gl.cpp",
		"src/renderer_gnm.cpp",
		"src/renderer_noop.cpp",
		"src/renderer_nvn.cpp",
		"src/renderer_vk.cpp",
		"src/shader.cpp",
		"src/shader_dxbc.cpp",
		"src/shader_spirv.cpp",
		"src/topology.cpp",
		"src/vertexlayout.cpp"
	)



