# Comfort shell

For greater comfort, you can use the development shell in `shell` directory using `nix develop`.
It saves you from enabling common experimental nix features and makes essential utilities available.

Example:
```
sudo nix develop --extra-experimental-features "nix-command flakes" ./shell
```