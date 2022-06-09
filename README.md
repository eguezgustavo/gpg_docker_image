# Docker image with Poetry binary

## Install

Build the docker images and create local directories
```
docker build -t eguezgustavo/gpg . or docker pull eguezgustavo/gpg
mkdir -p ~/.gnupg
```

Add alias to your shell profile
```
alias import_key="docker run --rm -v $HOME/.gnupg:/home/gpg_user/.gnupg eguezgustavo/gpg import $@"
alias print_key="docker run --rm -v $HOME/.gnupg:/home/gpg_user/.gnupg eguezgustavo/gpg print_public_key $@"
alias encrypt="docker run --rm -v $HOME/.gnupg:/home/gpg_user/.gnupg eguezgustavo/gpg encrypt $@"
alias decrypt="docker run --rm -v $HOME/.gnupg:/home/gpg_user/.gnupg eguezgustavo/gpg decrypt $@"
```

## Usage

To encrypt a text:
```
encrypt <text to encrypt> some@user.com
```

To decrypt a text:
```
decrypt <some encrypted text>
```

To print your public key:
```
print_key your@email.com
```

To add a public key:
```
import_key <base 64 encrypted public key>
```
