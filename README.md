# NixOS

This is my personal NixOS configuration

## File Structure

- [hosts](./hosts) - host specific configurations
  - [desktop](./hosts/desktop)
- [modules](./modules) - custom modules for use across hosts
  - [nixos](./modules/nixos) - nixos (system wide) modules
- [templates](./templates) - some templates for creating modules

## Branches

- `develop` is used to update or change general configurations that could apply to any host, such as creating a new module in `modules/nixos`. Changes here can be merged either directly to `main` or to a specific host branch.
- `desktop` is where I update configuration for the desktop host. This contains the most up to date configuration for desktop.
- `main` is a "production" branch that will receive merges from the host branches whenever I feel like or remember to. It could be considered stable (but don't).
