# MIT Jörg Thalheim - https://github.com/Mic92/dotfiles/blob/c6cad4e57016945c4816c8ec6f0a94daaa0c3203/nixos/modules/upgrade-diff.nix
{ root, inputs, cell, ... }:
{ self, config, lib, pkgs, ... }:
{
  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      if [[ -e /run/current-system ]]; then
        echo "--- diff to current-system"
        ${pkgs.nix}/bin/nix --extra-experimental-features nix-command store diff-closures /run/current-system "$systemConfig"
        echo "---"
      fi
    '';
  };
}
