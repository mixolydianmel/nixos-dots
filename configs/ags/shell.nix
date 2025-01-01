{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  name = "js-devshell";
  nativeBuildInputs = with pkgs; [
    typescript
    nodePackages.typescript-language-server
  ];
}
