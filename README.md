# Dotfiles

## Setup on a new machine

```bash
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply --verbose SnipyJulmy
```

## One shot setup

```bash
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --one-shot --verbose SnipyJulmy
```

# Warnings

For now this requires `age` + `keybase` for the identity and recipient of encrypted files...
