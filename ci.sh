#!/usr/bin/env bash
set -euo pipefail

cargo test --release
cargo build --release

mkdir -p dist
cp target/release/hello dist/hello
chmod +x dist/hello