# Practicalli Neovim Configuration

A Fennel configuration for Neovim 0.7.0 or greater, with a focus on Clojure REPL driven development with Conjure as well as general development workflow. A complete configuration to transform your Neovim in a simple, powerful and fun to use Clojure IDE


## Derived work

This project owes it existence to the contributions and guidance of [rafaeldelboni](https://github.com/rafaeldelboni/) and the amazing work on Aniseed and Conjure by Olical

* [rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide](https://github.com/rafaeldelboni/nvim-fennel-lsp-conjure-as-clojure-ide) - clearly documented configuration for those starting with Neovim and Clojure
* [rafaeldelboni/dotfiles](https://github.com/rafaeldelboni/dotfiles) - more advanced and updated configurations
* [Olical/dotfiles](https://github.com/Olical/dotfiles/tree/main/stowed/.config/nvim) - Neovim configuration from the author of Aniseed and Conjure (and many other wonderful things)


## Prerequisites

- [git](https://git-scm.com/downloads)
- [Neovim 0.7.0](https://neovim.io/) or greater
    - C compiler - e.g. gcc on Linux, clang on Termux(Android) - required for Neovim Treesitter
- [ripgrep](https://github.com/BurntSushi/ripgrep) to search for files
- [Clojure CLI](https://clojure.org/)
- [practicalli/clojure-deps-edn](https://clojure.org/) user level aliases adding a range of community tools
- [clojure-lsp](https://github.com/clojure-lsp/clojure-lsp) Language Server Protocol implementation for Clojure

## How to use

**Move `$HOME/.config/nvim` if you have an existing Neovim configuration**

```bash
mv  $HOME/.config/nvim  $HOME/backup/nvim
```

Clone the repository to the `$HOME/.config/nvim` directory
```bash
git clone git@github.com:practicalli/neovim-config-redux.git $HOME/.config/nvim
```

Run `nvim` without opening any files.

It is normal to see errors on the first run.  Although Aniseed and Packer are automatically added, Packer must be called within Neovim to install all the other the packages.

When you start nvim for the first time it will download packer and aniseed and show some errors, thats normal press enter to ignore and go to the

In nvim, press `:` and type `PackerInstall`  (or type `Pack` and press `TAB` to cycle through the menu of completions).

`RET` will run :PackerInstall, opening a new window (split) showing the progress of the install.

All the plugins declared in `fnl/config/plugin.fnl` should be installed

`:q!`  to close neovim and use the `nvim` command open Neovim again, hopefully without errors this time.

> Should errors persist, try `:PackerUpdate` in neovim and quit / restart.

## Plugins
 - [packer](https://github.com/wbthomason/packer.nvim) *Plugin/package management*
 - [aniseed](https://github.com/Olical/aniseed) *Bridges between fennel and nvim*
 - [conjure](https://github.com/Olical/conjure) *Interactive repl based evaluation for nvim*
 - [telescope](https://github.com/nvim-telescope/telescope.nvim) *Find, Filter, Preview, Pick*
   - [nvim-telescope/telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim) *switch between projects*
 - [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) *Incremental parsing system for highlighting, indentation, or folding*
 - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) *Quickstart configurations for the Nvim LSP client*
 - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) *Autocompletion plugin*
 - [github-nvim-theme](https://github.com/projekt0n/github-nvim-theme) *Github theme for Neovim*
 - [tpope-vim-sexp-bundle](https://github.com/tpope/vim-sexp-mappings-for-regular-people) *sexp mappings for regular people*
 - [lualine](https://github.com/nvim-lualine/lualine.nvim) *neovim statusline plugin written in pure lua*
 - [luasnip](https://github.com/L3MON4D3/LuaSnip) *Snippet Engine for Neovim written in Lua.*
 - [startup](https://github.com/startup-nvim/startup.nvim) *startup themes - using default dashboard*
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary) *toggles a comment for lines, visual selections or for motions*
- [pwntester/octo.nvim](https://github.com/pwntester/octo.nvim) *GitHub Issues & PRs via GitHub CLI*
- [tpope/commentary.vim](https://github.com/tpope/vim-commentary) *toggle line comments*
- [Todo Comments](https://github.com/folke/todo-comments.nvim) *Highlight and search for todo comments (TODO, NOTE, WARNING, FIX, HACK, PERF - specify in options)*
- [neogit](https://github.com/TimUntersberger/neogit) *Magit clone - WIP with lots of useful features already*
- [orgmode](https://github.com/nvim-orgmode/orgmode) *excellent note taking and agenda management*

Supporting plugins
- https://github.com/folke/trouble.nvim supports Todo Comments
- https://github.com/folke/lsp-colors.nvim

<!-- TODO: plugins added to configure -->

- [] [tpope/fugitive](https://github.com/tpope/vim-fugitive) *Git command line* installed, no key bindings yet (using neogit instead)

<!-- TODO: plugins to add -->
 - [ ] [terrortylor/nvim-comment](https://github.com/terrortylor/nvim-comment)
 - [ ] [ggandor/leap.nvim](https://github.com/ggandor/leap.nvim) motions (replacement for lightspeed), alternative to easy-motions ??

 - [ ] [kevinhwang91/rnvimr](https://github.com/kevinhwang91/rnvimr) *ranger in a floating window*
 - [ ] [dadbod.vim](https://github.com/tpope/vim-dadbod) interact with database - connect `:DB postgresql:///connection-string` or run a single expression
 - [ ] [vim-dadbob-ui](https://github.com/kristijanhusak/vim-dadbod-ui) - navigate database connections and save queries
 - [ ] [heroku.vim](https://github.com/tpope/vim-heroku) wraps the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and provides tab complete of commands - https://github.com/tpope/vim-heroku/blob/master/doc/heroku.txt
 - [ ] [p00f/nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow) *treesitter based rainbow parens*

 - https://github.com/ruifm/gitlinker.nvim share github links



# Using Neovim

## Starting Neovim

`nvim` runs Neovim on the command line and if no files are given as arguments then the startup dashboard is displayed, providing easy access to previously opened files and other common actions.

![Neovim startup plugin with dashboard theme](https://raw.githubusercontent.com/practicalli/graphic-design/live/neovim/screenshots/neovim-startup-dashboard-theme-light.png)


## Projects and files

Telescope and project plugin

TODO: configure telescope to respect the global gitignore patterns

Project key bindings - https://github.com/nvim-telescope/telescope-project.nvim#default-mappings-normal-mode


## Comments

[commentary.vim](https://github.com/tpope/vim-commentary) toggles a comment for lines, visual selections or for motions

`gcc` comment current line, `4gcc` comment current line and next 4 lines

`gc` comment region or use with motion e.g. `gcap` comment paragraph,

gc in operator pending mode to target a comment TODO: what is operator pending mode

`:7,17Commentary` comment a range

`:g/TODO/Commentary` as part of a :global invocation

`gcgc` removes comments from a set of adjacent commented lines.

## Version Control

Neogit provides a Magit style client.

> fugitive package provides a command line experience (no keybinding)

`<leader>gs` opens Git Status, by running `:Neogit`

Other commands to map
```
:Neogit kind=<kind> " override kind
:Neogit cwd=<cwd> " override cwd
:Neogit commit" open commit popup
```

## GitHub interaction

Work with GitHub issues and Pull Requests from the comfort of Neovim.

Requires the [GitHub CLI](https://cli.github.com/) for authentication to GitHub, using a developer personal access token that should be added to your GitHub account

TODO: Review [Octo.nvim configuration settings](https://github.com/pwntester/octo.nvim#%EF%B8%8F-configuration)

Command line form: `Octo <object> <action> [arguments]` - [Object, Action and Arguments commands](https://github.com/pwntester/octo.nvim#-commands)

List issues from current project (optionally add a specific repository)
```sh
:Octo issue list
```

Create a pull requests from current project

```sh
:Octo pr create
```

Add a comment to the current topic (issue/pr)
```sh
:Octo comment add

```

```sh
:Octo gist list
```

## Files

## [init.lua](init.lua)
Wrapper responsible for two things:
  - Download and setup our package manager ([packer.nvim](https://github.com/wbthomason/packer.nvim)) and our fennel helper/interface ([aniseed](https://github.com/Olical/aniseed))
  - Set the entrypoint for NVIM read our config files, in our case `fnl/config/init.fnl`.

## [fnl/config/init.fnl](fnl/config/init.fnl)
- Set basic global vim configurations and general keymaps.
- Load plugin configuration namespace.

> In this file among other settings I do set the leader key as `space` and local-leader as `,` for the sake of the examples of how use this configuration I will use this as basis for the commands.


## [fnl/config/plugin.fnl](fnl/config/plugin.fnl)
Here we define the plugins we want packer to download and load for us, we define here a private function called `use`
which will search in the plugin map for the keyword `:mod` and load the namespace defined in its value.

For example in the line we define that we need telescope we have this map:
```clojure
  :nvim-telescope/telescope.nvim
  {:requires [:nvim-lua/popup.nvim
              :nvim-lua/plenary.nvim]
   :mod :telescope}
```
This will state to packer download `nvim-telescope/telescope.nvim` and all the required plugins in `:requires` and search for the namespace `telescope`
in file located in the following path `fnl/config/plugin/telescope`, where I usually add plugin specific configuration like keymaps and settings.

## [fnl/config/plugin/conjure.fnl](fnl/config/plugin/conjure.fnl)
Conjure specifics settings, I like to remap the doc work keymap to be `<localleader>K` instead the only `K`, to not conflict with the LSP docs `K`.

## [fnl/config/plugin/telescope.fnl](fnl/config/plugin/telescope.fnl)
Settings like ignore `node_modules` and everything in `.gitignore` to be listed in the file finder.
Keymaps:
 - `<leader>ff` open the find files
 - `<leader>fg` open the fuzzy finder
 - `<leader>fb` open the find open buffer
 - `<leader>fh` open the nvim help fuzzy finder

## [fnl/config/plugin/treesitter.fnl](fnl/config/plugin/treesitter.fnl)
Settings to select which treesitter's features we want enabled and which language extension we want to ensure they will be always installed.

## [fnl/config/plugin/lspconfig.fnl](fnl/config/plugin/lspconfig.fnl)
All about nvim's lsp settings and keymaps.

### LSP Configuration

- In the first session, we define which symbols to show for lsp diagnostics.
- Later we describe which features and server settings we want to enable/customize.
  - Handler defines features and how we want to render the server outputs.
  - Capabilities we link with our autocompletion plugin (nvim-cmp), to say to the lsp servers that we have this feature enabled.
  - On_Attach we customize our interaction with the LSP server, here we define the following keymaps:
    - `gd` Go to definition
    - `K` Show documentations
    - `<leader>ld` Function declarations
    - `<leader>lt` Type Definitions
    - `<leader>lh` Signature Help
    - `<leader>ln` Rename
    - `<leader>le` Show line diagnostics
    - `<leader>lq` Show all diagnostics information
    - `<leader>lf` Auto format
    - `<leader>lj` Go to next diagnostic
    - `<leader>lk` Go to previous diagnostic
    - `<leader>la` Open code actions menu (Using telescope plugin interface)
    - `<leader>la` Open code actions menu for the selected text in **VISUAL mode** (Using telescope plugin interface)
    - `<leader>lw` Open workspace diagnostics list (Using telescope plugin interface)
    - `<leader>lr` Show all references list for item under the cursor (Using telescope plugin interface)
    - `<leader>lr` Show all implementations list for item under the cursor (Using telescope plugin interface)
- Lastly we configure to use all settings above in clojure-lsp server instance.

### [fnl/config/plugin/cmp.fnl](fnl/config/plugin/cmp.fnl)
Here settings of which sources we want to show up in the autocomple menu like (conjure, lsp, buffer) and some mapping to navigate in the menu.

## [fnl/config/plugin/theme.fnl](fnl/config/plugin/theme.fnl)

This configuration uses the [Neovim GitHub theme](https://github.com/projekt0n/github-nvim-theme) which gives 3 dark and 3 light themes to choose from.  Individual colors and styles can be configured to change specific parts of the theme.

The light theme is used by default, with a softer background colour that is slightly red-shifted.

Options are specified in the `theme.setup` function, where the option names are keywords and the values are strings, boolean or hash-map of more option keywords and values.

```
(theme.setup {:theme_style "light"
              :colors {:bg "#f8f2e6"}
              :comment_style "italic"})
```

The colors (Hex values) for each theme are in the [github-nvim-theme/lua/github-theme/palette](https://github.com/projekt0n/github-nvim-theme/tree/main/lua/github-theme/palette) with the overal theme definition in [github-nvim-theme/lua/github-theme/theme.lua](https://github.com/projekt0n/github-nvim-theme/blob/main/lua/github-theme/theme.lua)


## [fnl/config/plugin/sexp.fnl](fnl/config/plugin/sexp.fnl)

Settings for vim-sexp like enabling it for another lisp languages like Fennel and Jannet

### [fnl/config/plugin/lualine.fnl](fnl/config/plugin/lualine.fnl)

Configure the status line (lualine) that shows at the bottom of Neovim, defining colors and elements that appear on that line.

The Neovim GitHub theme includes definitions to set the look of the status line.

## Neovim in action

### Telescope - Find Files
![telescope-find-files](docs/telescope-find-files.gif)
**`<leader>ff`**

### Lsp - Syntax check
![lsp-syntax-check](docs/lsp-syntax-check.gif)
**`<leader>le`**

### Lsp - Go to definition
![lsp-go-to-definition](docs/lsp-go-to-definition.gif)
**`gd`**

### Lsp - Document/Signature Help
![lsp-document](docs/lsp-document.gif)
**`K`/`<leader>lh`**

### Lsp - Find definition/references
![lsp-find-references](docs/lsp-find-references.gif)
**`<leader>lr`**

### Lsp - Formatting
![lsp-format](docs/lsp-format.gif)
**`<leader>lf`**

### Lsp - Code actions
![lsp-code-actions](docs/lsp-code-actions.gif)
**`<leader>la`**

### Lsp - Refactorings
![lsp-refactorings](docs/lsp-refactorings.gif)
**`<leader>la`**

### Lsp - Rename
![lsp-rename](docs/lsp-rename.gif)
**`<leader>ln`**

### Conjure - Eval
![conjure-eval](docs/conjure-eval.gif)
**`<localleader>er`**

### Conjure - Repl
![conjure-repl](docs/conjure-repl.gif)
**`<localleader>lv`**

### Conjure - Document
![conjure-document](docs/conjure-document.gif)
**`<localleader>K`**

### Completion
![auto-complete](docs/auto-complete.gif)

## Contributing

Please raise an issue for anything other than trivial changes


## License

Creative Commons Attribution Share-Alike 4.0 International
