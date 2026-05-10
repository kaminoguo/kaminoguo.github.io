--------------------------------------------------------------------------------
-- site.hs — Hakyll generator for liu yuchen's personal site.
--
-- Build:    nix-shell --run "runghc site.hs build"
-- Watch:    nix-shell --run "runghc site.hs watch"
-- Clean:    nix-shell --run "runghc site.hs clean"
--------------------------------------------------------------------------------

{-# LANGUAGE OverloadedStrings #-}

import           Hakyll
import           Data.Monoid (mappend)


main :: IO ()
main = hakyll $ do

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match "static/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "templates/*" $ compile templateBodyCompiler

    match "content/index.md" $ do
        route   $ constRoute "index.html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" siteCtx
            >>= relativizeUrls


siteCtx :: Context String
siteCtx =
    constField "site_title"  "Liu Yuchen — Lyrica"            `mappend`
    constField "site_author" "Liu Yuchen"                     `mappend`
    constField "site_email"  "yliuoe@connect.ust.hk"          `mappend`
    constField "site_github" "kaminoguo"                      `mappend`
    defaultContext
