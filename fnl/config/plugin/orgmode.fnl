(module config.plugin.orgmode
  {autoload {orgmode orgmode}})

;;

(orgmode.setup
 {:org_agenda_files {"~/Documents/org/*" "~/projects/**/*"}
  :org_default_notes_file  "~/Documents/org/refile.org"})