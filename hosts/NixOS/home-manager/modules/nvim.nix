{ inputs, lib, ... }:

{
  home.activation.copyAstronvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ -L "$HOME/.config/nvim" ] || [ -e "$HOME/.config/nvim" ]; then
      rm -rf "$HOME/.config/nvim"
    fi

    cp -r --no-preserve=mode,ownership ${inputs.astronvim} "$HOME/.config/nvim"
  '';
}
