FROM ubuntu

RUN apt-get update -y && \
    apt-get install -y sudo curl && \
    useradd -ms /bin/bash gpg_user && \
    adduser gpg_user sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chown gpg_user -R /home/gpg_user

SHELL ["/bin/bash", "-c"] 

WORKDIR /home/gpg_user
USER gpg_user

COPY ./encrypt ./bin/encrypt
COPY ./decrypt ./bin/decrypt
COPY ./import ./bin/import
COPY ./print_public_key ./bin/print_public_key

ENV PATH="/home/gpg_user/bin:${PATH}"

RUN sudo apt-get install -y gnupg
