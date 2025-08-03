{config, inputs, pkgs, lib, ...}:
{
	virtualisation.libvirtd = {
  		enable = true;
  		qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
};
	programs.virt-manager.enable = true;
	users.extraGroups.libvirtd.members = [ "hal9000" ];
}


