# kaminoguo.github.io

Source for <https://kaminoguo.github.io> — Liu Yuchen's personal site.

Built with [Hakyll](https://jaspervdj.be/hakyll/) (Haskell). One static
binary generates the whole site from Markdown + a single HTML template.

## Layout

```
.
├── site.hs             generator (Haskell)
├── flake.nix           reproducible dev environment
├── content/            markdown sources
│   └── index.md
├── templates/
│   └── default.html
├── css/style.css
├── static/             passthrough assets (cv.pdf, ...)
└── _site/              build output (gitignored)
```

## Local development

Requires [Nix](https://nixos.org/download) with flakes enabled.

```sh
nix develop                  # enter dev shell (ghc + hakyll)
runghc site.hs watch         # serve at http://localhost:8000 with live reload
runghc site.hs build         # one-shot build into _site/
runghc site.hs clean         # nuke _site/ and _cache/
```

## Deploy

Pushes to `main` trigger `.github/workflows/deploy.yml`, which builds the
site with cabal and publishes `_site/` to GitHub Pages.

## License

Code: MIT. Prose and CV content: all rights reserved.
