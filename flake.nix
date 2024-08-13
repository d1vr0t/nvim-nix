{
  description = "Nvim";

  inputs = {
    ck3d-configs.url = "github:ck3d/ck3d-nvim-configs";
    danme-configs.url = "github:danme/nvim-nix";
  };

  outputs = { self, danme-configs, ck3d-configs }:
    let
      inherit (ck3d-configs.inputs) nixpkgs nix2nvimrc;
      inherit (nixpkgs) lib;
      inherit (ck3d-configs.lib lib) readDirNix;

      forAllSystems = lib.genAttrs lib.systems.flakeExposed;

      nix2nvimrcConfigsOverwrite = readDirNix ./configs;

    in
    {

      packages = forAllSystems
        (system:
          let
            pkgs = nixpkgs.legacyPackages.${system}
              // { ck3dNvimPkgs = ck3d-configs.packages.${system}; };

            nvims = builtins.mapAttrs
              (name: languages: (lib.evalModules {
                modules =
                  (nix2nvimrc.lib.modules pkgs)
                  ++ (builtins.attrValues ck3d-configs.nix2nvimrcModules)
                  ++ (builtins.attrValues ck3d-configs.nix2nvimrcConfigs)
                  ++ (builtins.attrValues nix2nvimrcConfigsOverwrite)
                  ++ [{
                    wrapper.name = name;
                    inherit languages;
                  }];
              }).config.wrapper.drv)
              rec {
                nvim-admin = [ "nix" "yaml" "bash" "markdown" "json" "toml" ];
                nvim-dev = nvim-admin ++ [
                  "rust"
                  "javascript"
                  "html"
                  "c"
                  "cpp"
                  "css"
                  "make"
                  "graphql"
                  "python"
                  "scheme"
                  "latex"
                  "devicetree"
                  "go"
                  "dhall"
                  "jq"
                  "vue"
                  "typescript"
                  "xml"
                  "plantuml"
                ];
              };
          in
          nvims // { default = nvims.nvim-dev; });
    };
}
