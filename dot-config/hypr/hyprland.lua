------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "highres@highrr",
	position = "auto",
	scale = "auto",
	bitdepth = 10
})


---------------------
------ GLOBALS ------
---------------------

vars = require("vars")
colors = require("colors")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

require("env")

-------------------
---- AUTOSTART ----
-------------------

require("autostart")


-----------------------
----- PERMISSIONS -----
-----------------------

require("perms")

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("decor")

-----------------------
------- LAYOUTS -------
-----------------------

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
require("layout")

----------------
----  MISC  ----
----------------

require("misc")

----------------
----  GROUP ----
----------------

require("group")

---------------
---- RENDER ---
---------------

require("render")

---------------
---- INPUT ----
---------------

require("input")

require("cursor")

---------------------
---- KEYBINDINGS ----
---------------------

require("binds")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("rules")

---------------
--- PLUGINS ---
---------------

require("plugins")



hl.config({
	experimental = {
		wp_cm_1_2 = true,
	},

	input_capture = {
		capture_modifiers = true
	},

	debug = {
-- 		-- disable_scale_checks = true,
-- 		disable_logs = false,
-- 		-- overlay = true, -- show fps
		suppress_errors = true,
-- 		-- pass = true,
-- 		error_position = 1,
-- 		-- log_damage = true,
-- 		-- damage_blink = true,
-- 		full_cm_proto = true,
	}
})
