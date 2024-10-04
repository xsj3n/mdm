#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p bash git

git add .
git commit -m "automated push"
git push

git remote add origin https://xsj3n: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@github.com/xsj3n/eye.git
