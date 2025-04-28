{pkgs, ...}: {
  # https://devenv.sh/packages/
  packages = with pkgs; [
    nil
    nixd
    zls
  ];

  # https://devenv.sh/languages/
  languages.zig.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  # scripts.hello.exec = ''
  #   echo hello from $GREET
  # '';

  # enterShell = ''
  #   hello
  #   git --version
  # '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    zig build test
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks.alejandra.enable = true;
  git-hooks.hooks.commitizen.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
