(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})

;; TODO: review conjure options

;; :help conjure - configuration section

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; REPL Clients

;; Initialise Conjure for specified filetypes
;; Default: `["clojure", "fennel", "janet", "racket", "scheme"]`
;; (set nvim.g.conjure#filetypes [:clojure :fennel])

;; Client to use for `clojure` buffers.
;; Help: |conjure-client-clojure-nrepl|
;; Default: `"conjure.client.clojure.nrepl"`
;; (set nvim.g.conjure#filetype#clojure :conjure.client.clojure.nrepl)

;; Client to use for `fennel` buffers.
;; Help: |conjure-client-fennel-aniseed|, |conjure-client-fennel-stdio|
;; Default: use aniseed from within Neovim
;; (set nvim.g.conjure#filetype#fennel :conjure.client.fennel.aniseed)
;; Alterntative: use Fennel outside of Neovim in an external lua process
;; (set nvim.g.conjure#filetype#fennel :conjure.client.fennel.stdio)

;; Client to use for `janet` buffers.
;; Help: |conjure-client-janet-netrepl|
;; Default: `"conjure.client.janet.netrepl"`
;; (set nvim.g.conjure#filetype#janet :conjure.client.janet.netrepl)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Evaluation

;; Every Conjure evaluation result is placed in a Neovim register
;; `"cp` to paste the result into a buffer `<C-r>c` in insert mode.
;; Alternative register suggestions:
;; * `"\""` or `"*"` the default register for easy access.
;; * `"C"` if you want to keep your lower case registers clear.
;; * `"_"` the black hole when you don't want this at all.
;; Default: `"c"`
;; Set to `e` register for evaluation (or could use r for result)
(set nvim.g.conjure#eval#result_register :e)

;; Inline evaluation results (display results after expression)
;; Default: `true`
;; (set nvim.g.conjure#eval#inline_results true)

;; Set highlight group used for the inline results - :help highlight-groups
;; Default: `"Comment"`
;; (set nvim.g.conjure#eval#inline#highlight :Comment)

;; Set prefix used for inline results
;; Default: `"=> "`
;; (set nvim.g.conjure#eval#inline#prefix "=> ")

;; Comment prefix used for "eval and insert result as comment"
;; Default: `nil` (use language filetype comment character)
;; (set nvim.g.conjure#eval#comment_prefix nil)

;; Lua `string.gsub` modifications made before is evaluated
;; Define a key to name the substitution (shown if there is an error)
;; Define a Lua pattern to match against, followed by its replacement value
;; Reference: Lua patterns: https://www.lua.org/pil/20.2.html
;; NOTE: substitution not required on :develop branch from 2022-07-02
;; Evaluation forms commented with Reader Macro comment #_
;; (set nvim.g.conjure#eval#gsubs {:eval-reader-comment ["#_" ""]})
;; Treat comment as do expression - No longer required
;; (set nvim.g.conjure#eval#gsubs {:do-comment ["^%(comment[%s%c]" "(do "]}) ; eval comment as do
;; (set nvim.g.conjure#eval#gsubs {:do-comment ["^%(comment[%s%c]" "(do "]}) ; eval comment as do

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Key bindings / mappings

;; Set Cojure specific local leader
;; Default: `"<localleader>"`
;; (set nvim.g.conjure#mapping#prefix "<localleader>")

;; Open log in  horizontal split
;; Default: `"ls"`
;; (set nvim.g.conjure#mapping#log_split "ls")

;; Opens the log in a vertical split.
;; Default: `"lv"`
;; (set nvim.g.conjure#mapping#log_vsplit "lv")

;; Open log in a new tab
;; Default: `"lt"`
;; (set nvim.g.conjure#mapping#log_tab "lt")

;; Opens the log in the current window.
;; Default: `"le"`
;; (set nvim.g.conjure#mapping#log_buf "le")

;; Toggle log using the last used vertical or horizontal split command
;; Default: `"lg"`
;; (set nvim.g.conjure#mapping#log_toggle "lg")

;; Soft reset the log buffer by wiping the contents.
;; Default: `"lr"`
;; (set nvim.g.conjure#mapping#log_reset_soft "lr")

;; Hard reset the log buffer by deleting the entire buffer.
;; Default: `"lR"`
;; (set nvim.g.conjure#mapping#log_reset_hard "lR")

;; Jump to top of latest evaluation result in log
;; Default: `"ll"`
;; (set nvim.g.conjure#mapping#log_jump_to_latest "ll")

;; Close all visible log windows
;; Default: `"lq"`
;; (set nvim.g.conjure#mapping#log_close_visible "lq")

;; Evaluates the form under the cursor
;; Default: `"ee"`
;; (set nvim.g.conjure#mapping#eval_current_form "ee")

;; Evaluate form under the cursor & inserts result as comment.
;; Default: `"ece"`
(set nvim.g.conjure#mapping#eval_comment_current_form "ece")

;; Evaluate root form under the cursor
;; Default: `"er"`
(set nvim.g.conjure#mapping#eval_root_form "ef")

;; Evaluate root form under the cursor & insert result as comment
;; Default: `"ecr"`
(set nvim.g.conjure#mapping#eval_comment_root_form "ecf")

;; Evaluate word under cursor
;; Default: `"ew"`
;; (set nvim.g.conjure#mapping#eval_word "ew")

;; Evaluate word under the cursor and insert result as comment
;; Default: `"ecw"`
;; (set nvim.g.conjure#mapping#eval_comment_word "ecw")

;; Evaluates the form under the cursor and replace with the result.
;; Default: `"e!"`
;; (set nvim.g.conjure#mapping#eval_replace_form "e!")

;; Evaluates the form at the marks location.
;; Default: `"em"`
;; (set nvim.g.conjure#mapping#eval_marked_form "em")

;; Evaluate form under the cursor & display result as a comment
;; Default: `"ec"`
;; (set nvim.g.conjure#mapping#eval_comment_form "ec")

;; Evaluate file loaded from disk
;; Default: `"ef"`
(set nvim.g.conjure#mapping#eval_file "el")

;; Evaluates the buffer from memory.
;; Default: `"eb"`
;; (set nvim.g.conjure#mapping#eval_buf "eb")

;; Evaluates the visual selection.
;; Default: `"E"`
;; (set nvim.g.conjure#mapping#eval_visual "eE")

;; Evaluates the following motion.
;; Default: `"E"`
;; (set nvim.g.conjure#mapping#eval_motion "eE")


;; TODO: review conjure bindings with respect to LSP

;; Jump to definition of the word under the cursor.
;; Default: `"gd"`
;; (set nvim.g.conjure#mapping#def_word "ed")

;; Documentation for word under cursor
;; Default: `["K"]`
;; (set nvim.g.conjure#mapping#doc_word "K")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Visual aspects

;; Enable highlighting of evaluated forms, requires highlight API in Neovim 0.5+.
;; Default: `false`
;; (set nvim.g.conjure#highlight#enabled true)

;; Syntax group to highlight forms
;; Default: `"IncSearch"`
;; (set nvim.g.conjure#highlight#group "IncSearch")

;; Highlight duration in milliseconds
;; Default: `500`
;; (set nvim.g.conjure#highlight#timeout 500)

;; Width of HUD as percentage of the editor width
;; A float between 0.0 and 1.0.
;; Default: `0.42`
(set nvim.g.conjure#log#hud#width 1)

;; Height of HUD as a percentage of editor height
;; A float between 0.0 and 1.0.
;; Default: `0.3`
;; (set nvim.g.conjure#log#hud#height 0.3)

;; Display HUD
;; Default: `true`
(set nvim.g.conjure#log#hud#enabled false)

;; Delay closing HUD passively (milliseconds) e.g. after cursor move
;; Default: `0` - closes HUD instantly
;; (set nvim.g.conjure#log#hud#passive_close_delay 0)

;; Duration HUD must be open before passively closed from cursor movement
;; Evaluations involving cursor movement do not close HUD the moment it displays
;; Default: `20` (milliseconds)
;; (set nvim.g.conjure#log#hud#minimum_lifetime_ms 20)

;; HUD window padding for cursor detection, moving HUD to opposite side of screen
;; Default: `0.1`  (float between 0.0 and 1.0.)
;; (set nvim.g.conjure#log#hud#overlap_padding 0.1)

;; Preferred corner position for the HUD, over-ridden by HUD cursor detection
;; Example: Set to `"SE"` and HUD width to `1.0` for full width HUD at bottom of screen
;; Default: `"NE"`
(set nvim.g.conjure#log#hud#anchor "SE")

;; HUD border style - see `border` parameter in `:h nvim_open_win()`
;; `"none"` for no border
;; Default: `"single"`
;; (set nvim.g.conjure#log#hud#border "single")

;; Show HUD for "low priority" messages, e.g. `stdout` & `stderr` for Clojure
;; Default: `false`
;; (set nvim.g.conjure#log#hud#ignore_low_priority false)

;; Open log at bottom or far right of editor, using full width or height
;; Default: `false`
(set nvim.g.conjure#log#botright true)

;; Character length of comment between log results
;; Default: `80`
;; (set nvim.g.conjure#log#break_length 80)

;; Log line count before results trimmed
;; Default: `10000`
;; (set nvim.g.conjure#log#trim#at 10000)

;; Number of lines to trim the log down to
;; Default: `7000`
;; (set nvim.g.conjure#log#trim#to 7000)

;; Line limit for stripping ANSI escape sequences from text appended to the log
;; `0` to use ANSI escape sequence highlight plugin to display colours in the log
;; Default: `100`
;; (set nvim.g.conjure#log#strip_ansi_escape_sequences_line_limit 100)

;; Enable line wrapping in the HUD and log.
;; Default: `false`
;; (set nvim.g.conjure#log#wrap false)

;; Enable or disable folding of results.
;; Default: `false`
;; (set nvim.g.conjure#log#fold#enabled false)

;; Fold results greater than fold line number
;; Default: `10`
;; (set nvim.g.conjure#log#fold#lines 10)

;; Marker representing start of a log fold
;; Default: `"~~~%{"`
;; (set nvim.g.conjure#log#fold#marker#start "~~~%{")

;; Marker to use to represent the end of a log fold.
;; Default: `"}%~~~"`
;; (set nvim.g.conjure#log#fold#marker#end "}%~~~")

;; Log buffer - set cursor to the top of the latest evaluation output
;; Default: `false`
;; (set nvim.g.conjure#log#jump_to_latest#enabled false)

;; Scroll log window to set cursor location after jumping to latest entry
;; `top`, `center`, `bottom` and `none` (no scroll)
;; Default: `"top"`
;; (set nvim.g.conjure#log#jump_to_latest#cursor_scroll_position "top")

;; Number of lines to check for `ns` form, used for setting evaluation context
;; `b:conjure#context` to override a specific buffer that isn't finding the context
;; Default: `24`
(set nvim.g.conjure#extract#context_header_lines 100)

;; Character pairs to search for when evaluating forms.
;; Closest matching pair when evaluating current form, furthest matching pair for root forms
;; Structure of each item is `[start end escape?]` where the first two are characters
;; and the third is an optional boolean to enable escaping for use in |searchpairpos()|.
;; Default: `[["(" ")"] ["{" "}"] ["[" "]" true]]`
;; (set nvim.g.conjure#extract#form_pairs [["(" ")"] ["{" "}"] ["[" "]" true]])

;; Tree-sitter support for extracting code from the buffer by non-Lisp clients,
;; to find appropriate chunk of code under the cursor to evaluate.
;; Experimental. More information: https://github.com/Olical/conjure/issues/246
;; Default: `true`
;; (set nvim.g.conjure#extract#tree_sitter#enabled true)

;; Size of code preview for evaluated form, as percentage width of editor
;; Also affects the preview in folded results.
;; A float between 0.0 and 1.0.
;; Default: `0.3`
;; (set nvim.g.conjure#preview#sample_limit 0.3)

;; Resolve absolute file paths to a relative, for docker containers or remote file systems
;; e.g resolve file paths relative to a sub-directory under Neovim current working directory.
;; (set nvim.g.conjure#relative_file_root "/sub-project")
;; `/foo/bar/sub-project/baz.clj` would be `baz.clj` if Neovim CWD was `/foo/bar`.
;; See also `g:conjure#path_subs`.
;; Default: `undefined`
;; (set nvim.g.conjure#relative_file_root :undefined)

;; Modify paths for "go to definition" and "eval file", using Lua `string.gsub`
;; Keys of the `path_subs` table are patterns, values are the replacements.
;; Lua pattern documentation: https://www.lua.org/pil/20.2.html
;; {"/root/.m2" "/home/ollie/.m2"
;;  "/src/app" "."
;;  "^(/home)/foo" "%1/bar"}
;; Used when connecting to REPLs outside of local machine or within Docker containers
;; where the filesystems don't quite match up.
;; Default: `undefined`
;; (set nvim.g.conjure#path_subs :undefined)

;; Display debug information in any client
;; Default: `false`
;; (set nvim.g.conjure#debug false)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Conjure Client Clojure nrepl configuration

;; CONFIGURATION                     *conjure-client-clojure-nrepl-configuration*

;; All configuration can be set as described in |conjure-configuration|.

;; Would this be useful to set if always using a remote host?
;; Or if a specific IP address is required?
;; When connecting to port files or via `:ConjureConnect` this is the default host to use.
;; Default: `"localhost"`
;; (set nvim.g.conjure#client#clojure#nrepl#connection#default_host "localhost")

;; List of file paths to check when starting up or hitting `<localleader>cf` (by default).
;; They're checked in order, the first file to exist has it's contents parsed as a number.
;; Conjure will then connect to that port at the host specified by `connection.default-host`.
;; Conjure checks every directory above your current one as well as `~/.config/conjure`, so you can place a default `.nrepl-port`file in there to always have a default port to attempt.
;; Default: `[".nrepl-port" ".shadow-cljs/nrepl.port"]`
;; (set nvim.g.conjure#client#clojure#nrepl#connection#port_files [".nrepl-port" ".shadow-cljs/nrepl.port"])


;; Start "auto-repl" process, eg. babashka
;; when Conjure unable to find candidate REPL process via to an existing nREPL connection
;; Default: `true`
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)

;; Hide auto-repl buffer when triggered, to avoid the need to interact with that buffer
;; Default: `false`
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#hidden true)

;; Command to start the auto-repl
;; Default: `"bb nrepl-server localhost:8794"`
(set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#cmd nil)

;; REPL port and file name to write port number for the auto-repl
;; File deleted on auto-repl exit if port in file is same as auto-repl port
;; Default: `".nrepl-port"`, `"8794"`
;; (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#port "8794")
;; (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#port_file ".nrepl-port")

;; Pretty printed results by the nREPL server, using `clojure.pprint/write`
;; Default: `true`
;; (set nvim.g.conjure#client#clojure#nrepl#eval#pretty_print true)

;; Print raw evaluation result, suppressing prefix for stdout lines `; (out)`
;; Default: `false`
(set nvim.g.conjure#client#clojure#nrepl#eval#raw_out true)

;; A hard limit on the number of bytes printed for each value.
;; Default: `nil`
;; (set nvim.g.conjure#client#clojure#nrepl#eval#print_quota nil)

;; Size of buffer when streaming results. Defaults to 1024 within nREPL itself.
;; Increase value to reduce the amount message splitting by nREPL for large results.
;; Default: `nil`
;; (set nvim.g.conjure#client#clojure#nrepl#eval#print_buffer_size nil)

;; A fully-qualified symbol naming a var whose function to use for printing.
;; Must point to a function with signature [value writer options].
;; Default: `"conjure.internal/pprint"`
;; (set nvim.g.conjure#client#clojure#nrepl#eval#print_function "conjure.internal/pprint")

;; Automatically require namespace of new buffer or current buffer after connection
;; Ensures buffers are loaded, required code to compile and (re)loadable.
;; Default: `true`
(set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)

;; Maximum depth of evaluation result with pretty printer. Elide output after number of lines.
;; Set it to `false` to disable this limit.
;; Default: `50`
;; (set nvim.g.conjure#client#clojure#nrepl#eval#print_options#level 50)

;; Limit evaluation output, Elide output surpasses the number of items
;; i.e for preventing infinite lazy sequences from melting the CPU
;; Set to `false` to disable limit.
;; Default: `500`

;; How many characters to show of the code you just interrupted as a preview in the log. The value is based on a percentage of the width of the full editor.
;; Default: `0.3`
;; (set nvim.g.conjure#client#clojure#nrepl#interrupt#sample_limit 0.3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Reloading code

;; Function to call on refresh (reloading) the log, namespace-qualified name of a zero-arity
;; e.g. lifecycle management: Integrant, mount, etc.
;; Default: `nil`
;; (set nvim.g.conjure#client#clojure#nrepl#refresh#after nil)

;; The namespace-qualified name of a zero-arity function to call before reloading.
;; Default: `nil`
;; (set nvim.g.conjure#client#clojure#nrepl#refresh#before nil)

;; List of directories to scan. If no directories given, defaults to all directories on the classpath.
;; Default: `nil`
;; (set nvim.g.conjure#client#clojure#nrepl#refresh#dirs nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Unit tests

;; List of keywords used to decide if current root form is a test to run
;; Default: `["deftest"]`
;; (set nvim.g.conjure#client#clojure#nrepl#test#current_form_names ["deftest"])

;; Test runner called from the test key mappings
;; * `"clojure"`
;; * `"clojurescript" (cljs.test instead of clojure.test)`
;; * `"kaocha"`
;; Default: `"clojure"`
(set nvim.g.conjure#client#clojure#nrepl#test#runner "kaocha")

;; Print raw test evaluation result, suppressing prefix for stdout lines `; (out)`
;; Default: `true`
(set nvim.g.conjure#client#clojure#nrepl#test#raw_out true)

;; Override string appended to the end of the test runner calls
;; Not used by default `clojure` test runner
;; `koacha` default is `"{:kaocha/color? false}"`, you can replace this to change the configuration file:
;; "{:kaocha/color? false, :config-file \"tests.local.edn\"}"
;; This string is inserted into the code as is, so you can insert Clojure code to add conditional logic
;; Default: `nil`
;; (set nvim.g.conjure#client#clojure#nrepl#test#call_suffix nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Key bindings (mappings)

;; Key binding to disconnect from the current nREPL server.
;; Default: `cd`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#disconnect "cd")

;; Connect to a local server via a port file.
;; Default: `cf`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#connect_port_file "cf")

;; Interrupt an evaluation.
;; Default: `ei`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#interrupt "ei")

;; View the last exception.
;; Default: `ve`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#last_exception "ve")

;; View the most recent result.
;; Default: `v1`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#result_1 "vl")

;; View the 2nd most recent result.
;; Default: `v2`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#result_2 "v2")

;; View the 3rd most recent result.
;; Default: `v3`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#result_3 "v3")

;; View the source of the symbol under the cursor.
;; Default: `vs`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#view_source "vs")

;; Clone the current session.
;; Default: `sc`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#session_clone "sc")

;; Create a fresh session.
;; Default: `sf`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#session_fresh "sf")

;; Close the current session.
;; Default: `sq`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#session_close "sq")

;; Close all sessions.
;; Default: `sQ`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#session_close_all "sQ")

;; List all current sessions.
;; Default: `sl`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#session_list "sl")

;; Assume the next session in the list.
;; Default: `sn`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#session_next "sn")

;; Assume the previous session in the list.
;; Default: `sp`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#session_prev "sp")

;; Select a session from the list with an interactive prompt.
;; Default: `ss`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#session_select "ss")

;; Run all loaded tests.
;; Default: `ta`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#run_all_tests "ta")

;; Run all tests within the current namespace.
;; Default: `tn`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#run_current_ns_tests "tn")

;; Run all tests within alternate namespace.
;; Executing in `foo.bar` would test `foo.bar-test` and the other way around.
;; Default: `tN`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#run_alternate_ns_tests "tN")

;; Run the test under the cursor, can be used from anywhere within the form.
;; Default: `tc`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#run_current_test "tc")

;; Refresh changed namespaces.
;; Default: `rr`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#refresh_changed "rr")

;; Refresh all namespaces.
;; Default: `ra`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#refresh_all "ra")

;; Clear the namespace refresh cache.
;; Default: `rc`
;; (set nvim.g.conjure#client#clojure#nrepl#mapping#refresh_clear "rc")

;; Use `clj-suitable` to improve cljs completion.
;; Default: `true`
;; (set nvim.g.conjure#client#clojure#nrepl#completion#cljs#use_suitable true)

;; Extract the root form surrounding the cursor as you type,
;; providingt local context aware completions (such as local let block items).
;; Potential huge performance hit on slower machines in large buffers with lots of top level forms.
;; Default: `false`
;; (set nvim.g.conjure#client#clojure#nrepl#completion#with_context true)
