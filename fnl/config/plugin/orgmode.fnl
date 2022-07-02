(module config.plugin.orgmode
  {autoload {orgmode orgmode}})

;; https://github.com/nvim-orgmode/orgmode#setup

(orgmode.setup_ts_grammar)

;; TODO: add orgmode as nvim-cmp source
;; orgmode highlight, indent and ensure_installed set in treesitter.fnl configuration

(orgmode.setup
 {:org_agenda_files {"~/Documents/org/*" "~/projects/**/*"}
  :org_default_notes_file  "~/Documents/org/refile.org"})