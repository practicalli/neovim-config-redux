(module config.plugin.neogit
  {autoload {neogit neogit}})

  ;; https://github.com/TimUntersberger/neogit#configuration

(neogit.setup
 {:disable_signs false

  ;; Disable key binding hints on top of panel
  :disable_hint true

  ;; Show scope of change relative to cursor position
  :disable_context_highlighting false

  ;; Commit without confirmation on buffer save
  :disable_commit_confirmation true

  ;; Normal mode when opening commit message buffer
  ;; false for insert mode by default
  :disable_insert_on_commit true

  ;; Automatically refresh Git state on changes to files (disable for very large repositories)
  :auto_refresh true

  :disable_builtin_notifications false

  ;; F key binding to pull (fetch) from remote repositories
  ;; defalut: false
  :use_magit_keybindings true

  ;; Where to open Neogit: "tab" (default) or "split" (window)
  :kind "tab"

  ;; Where to open the commit popup
  :commit_popup {:kind "split"}

  ;; Where to open popups
  :popup {:kind "split"}

  ;; status buffer section signs { Closed, Opened }
  :signs
  {:section ["" ""]   ;; staged, unstaged, etc
   :item ["" ""]      ;; files
   :hunk ["﮵" "﮴"]}     ;; git hunks

  ;; Neogit provides inline diffs
  ;; `sindrets/diffview.nvim` integration enables diff popup around
  :integrations {:diffview true}

  ;; Setting any section to `false` will make the section not render at all
  :sections
  {:untracked {:folded false}
   :unstaged  {:folded false}
   :staged    {:folded false}
   :stashes   {:folded true}
   :unpulled  {:folded true}
   :unmerged  {:folded false}
   :recent    {:folded true}}

  ;; override/add mappings
  :mappings {
    ;; modify status buffer mappings
    :status {
      ;; Adds a mapping with "B" as key that does the "BranchPopup" command
      ;; :B "BranchPopup"
      ;; Removes the default mapping of "s"
      ;; :s ""
    }
  }
 }
)
