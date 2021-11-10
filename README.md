# My personal dotfiles for OSX

Add first start open console and execute

```bash
xcode-select --install
```

Create ssh keys

```bash
# Add -N '' if you don't want a passphrase
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "yourmail@provider.tld"

# If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
ssh-keygen -o -a 100 -t rsa -b 4096 -f ~/.ssh/id_rsa -C "yourmail@provider.tld"

eval "$(ssh-agent -s)"

ssh-add
```

If you’re using macOS Sierra 10.12.2 or later, to load the keys automatically and store the passphrases in the Keychain, you need to configure your ~/.ssh/config file:

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
  IdentityFile ~/.ssh/id_rsa # Keep any old key files if you want
```


You can install them by cloning the repository as `.dotfiles` in your home directory and running the bootstrap script.

```bash
git clone git@github.com:etenzy/.dotfiles.git
cd .dotfiles
./bootstrap
```

The bootstrap script can be run by cd-ing into the `.dotfiles` directory and performing this command:

```bash
./bootstrap
```

Feel free to create an issue on this repo if you have any questions about them.

Template:

```bash
if [[ "$ENABLE_INSTALL_XXX" == "true" ]]; then
    echo ''
    echo 'Install XXX'
    echo '-----------'
    brew install xxx
fi
```
