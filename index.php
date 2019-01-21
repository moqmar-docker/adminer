<?php

	function adminer_object()
	{
		// Required to run any plugin.
		include_once "./plugins/plugin.php";

		// Plugins auto-loader.
		foreach (glob("plugins/*.php") as $filename) {
			include_once "./$filename";
		}

		// Specify enabled plugins here.
		$plugins = [
			new AdminerJsonPreview(),
			new AdminerReadableDates(),
			new AdminerTableHeaderScroll(),
			//new AdminerTablesFuzzySearch(),
		
			// AdminerTheme has to be the last one!
			// Color variant can by specified in constructor parameter.
			new AdminerTheme(),
		];

		return new AdminerPlugin($plugins);
	}

	// Include original Adminer or Adminer Editor.
	include "./adminer.php";