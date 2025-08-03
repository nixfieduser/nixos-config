{config, inputs, pkgs, lib, ...}:
{

	programs.yazi = {
		enable = true;
		enableBashIntegration = true;
		settings = {

			manager = {
			    show_hidden = true;};


    };
  };
}

