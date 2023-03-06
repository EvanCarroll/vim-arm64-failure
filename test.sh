ctr=$(buildah from debian:bookworm);
buildah run $ctr sh -- <<EOF
	apt-get update;
	apt-get -y install neovim;
	apt-get clean;
EOF

buildah commit $ctr bookworm-vim;

podman run -v ./nvim/:/root/.config/nvim/ -ti bookworm-vim nvim
