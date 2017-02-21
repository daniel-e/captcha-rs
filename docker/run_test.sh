#!/bin/bash

set -e
LOG=/tmp/log

cat /etc/issue | head -n1 > $LOG

# latest stable version of Rust
echo "Rust stable"
cd /tmp/
curl https://sh.rustup.rs -sSf | sh -s -- -y
export PATH=$PATH:~/.cargo/bin/
rustc -V >> $LOG
git clone https://github.com/daniel-e/captcha.git
cd captcha
cargo build
cargo test
echo -e '\033[1;32m'"TEST OK"'\033[0m'

# Rust beta
echo "Rust beta"
rm -rf ~/.cargo/bin/
cd /tmp/
curl -s https://static.rust-lang.org/dist/rust-beta-x86_64-unknown-linux-gnu.tar.gz --output r.tar.gz
tar xzf r.tar.gz
cd rust-beta-x86_64-unknown-linux-gnu/
./install.sh --prefix=/opt/rust
export PATH=$PATH:/opt/rust/bin/
rustc -V >> $LOG
cd ../captcha/
cargo build
cargo test
echo -e '\033[1;32m'"TEST OK"'\033[0m'

echo
echo
echo -e '\033[1;32m'"TEST ENVIRONMENT"'\033[0m'
cat $LOG
exit 0
