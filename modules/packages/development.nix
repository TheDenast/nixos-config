{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Editors
    vim # grandpa
    neovim-unwrapped # THE editor
    code-cursor # AI IDE built on VS-Code

    # Git
    git # versioning software
    lazygit # git TUI wrapper
    gh # github cli tool

    # C / C++
    gcc # C compiler
    clang-tools # clang toolkit
    gnumake # Makefile support
    valgrind # Memory management analysis tool
    bear # tool that generates a compilation database for clang tooling

    # Rust
    rustc # Rust compiler
    cargo # Rust dependencies manager
    rust-analyzer # Rust lsp
    rustfmt # Rust formatter
    clippy # Rust linter

    # Go
    go # google something something language

    # Lua
    lua # Lua language
    lua-language-server # lsp for lua
    stylua # opinionated lua formatter

    # Python
    uv # modern python package manager
    basedpyright # python type checker
    ruff # python linter
    black # uncompromising python formatter

    # Nix
    nixfmt-rfc-style # opinionated formatter for Nix
    nixd # Nix lsp (configurable but heavy)
    nil # Nix lsp (light but basic)

    # Node.js / TypeScript
    nodejs_22
    typescript
    typescript-language-server
    vscode-langservers-extracted # JSON, HTML, CSS, ESLint
    prettier
    eslint

    # Docker
    docker-compose-language-service

    # Dev tools
    pgadmin4-desktopmode # Administration and development platform for PostgreSQL
    postman # API development
    bruno # API dev
    nrfconnect # Nordic Semiconductor nRF Connect for Desktop
    awscli2 # for AWS work
    android-tools # adb and friends
    openvpn # for connection to corporate vpn
    wakatime-cli # util to track codin' activity
    claude-code # Claude terminal-based AI agent
  ];
}
