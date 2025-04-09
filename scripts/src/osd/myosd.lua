dofile("modules.lua")


function maintargetosdoptions(_target,_subtarget)
	configuration { }
end

project ("qtdbg_" .. _OPTIONS["osd"])
	uuid (os.uuid("qtdbg_" .. _OPTIONS["osd"]))
	kind (LIBTYPE)

	-- dofile("mac_cfg.lua")
	includedirs {
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/devices", -- accessing imagedev from debugger
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "src/osd/modules/render",
		MAME_DIR .. "3rdparty",
	}
	configuration { "linux-* or freebsd" }
		buildoptions {
			"-fPIC",
		}
	configuration { }

	qtdebuggerbuild()

project ("osd_" .. _OPTIONS["osd"])
	targetsubdir(_OPTIONS["target"] .."_" .._OPTIONS["subtarget"])
	uuid (os.uuid("osd_" .. _OPTIONS["osd"]))
	kind (LIBTYPE)

	-- dofile("mac_cfg.lua")
	-- osdmodulesbuild()

	includedirs {
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/devices", -- accessing imagedev from debugger
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "src/osd/modules/file",
		MAME_DIR .. "src/osd/modules/render",
		MAME_DIR .. "3rdparty",
		MAME_DIR .. "src/osd/myosd",
        MAME_DIR .. "src/frontend/mame"
	}

	files {
		MAME_DIR .. "src/osd/myosd/input.cpp",
		MAME_DIR .. "src/osd/myosd/myosd-droid.cpp",
		MAME_DIR .. "src/osd/myosd/myosdmain.cpp",
		MAME_DIR .. "src/osd/myosd/opensl_snd.cpp",
		MAME_DIR .. "src/osd/myosd/osdlib.cpp",
		MAME_DIR .. "src/osd/myosd/sound.cpp",
		MAME_DIR .. "src/osd/myosd/video.cpp",
		-- MAME_DIR .. "src/osd/myosd/file/posixdir.cpp",
		-- MAME_DIR .. "src/osd/myosd/file/posixfile.cpp",
		-- MAME_DIR .. "src/osd/myosd/file/posixptty.cpp",
		-- MAME_DIR .. "src/osd/myosd/file/posixsocket.cpp",
		MAME_DIR .. "src/osd/osdnet.cpp",
		MAME_DIR .. "src/osd/interface/inputseq.cpp",
		MAME_DIR .. "src/osd/interface/inputseq.h",
		MAME_DIR .. "src/osd/interface/nethandler.cpp",
		MAME_DIR .. "src/osd/interface/nethandler.h",
	}

	configuration { "android*" }
		links {
			"-lOpenSLES"
		}

project ("ocore_" .. _OPTIONS["osd"])
	targetsubdir(_OPTIONS["target"] .."_" .. _OPTIONS["subtarget"])
	uuid (os.uuid("ocore_" .. _OPTIONS["osd"]))
	kind (LIBTYPE)

	removeflags {
		"SingleOutputDir",
	}

	-- dofile("mac_cfg.lua")

	includedirs {
		MAME_DIR .. "src/emu",
		MAME_DIR .. "src/osd",
		MAME_DIR .. "src/lib",
		MAME_DIR .. "src/lib/util",
		MAME_DIR .. "src/osd/myosd",
	}

	files {
		MAME_DIR .. "src/osd/osdcore.cpp",
		MAME_DIR .. "src/osd/osdcore.h",
		MAME_DIR .. "src/osd/osdfile.h",
		MAME_DIR .. "src/osd/strconv.cpp",
		MAME_DIR .. "src/osd/strconv.h",
		MAME_DIR .. "src/osd/osdsync.cpp",
		MAME_DIR .. "src/osd/osdsync.h",
		MAME_DIR .. "src/osd/modules/osdmodule.cpp",
		MAME_DIR .. "src/osd/modules/osdmodule.h",
		MAME_DIR .. "src/osd/myosd/osdlib.cpp",
		MAME_DIR .. "src/osd/modules/lib/osdlib.h",
		MAME_DIR .. "src/osd/myosd/file/posixdir.cpp",
		MAME_DIR .. "src/osd/myosd/file/posixfile.cpp",
		MAME_DIR .. "src/osd/myosd/file/posixfile.h",
		MAME_DIR .. "src/osd/myosd/file/posixptty.cpp",
		MAME_DIR .. "src/osd/myosd/file/posixsocket.cpp",
	}	

	configuration { "android*" }
		links {
			"-lOpenSLES"
		}