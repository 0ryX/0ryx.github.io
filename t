Jujutsu (An experimental VCS)

[1m[33mUsage:[0m [1m[32mjj[0m [32m[OPTIONS][0m [32m<COMMAND>[0m

[1m[33mCommands:[0m
  [1m[32mabandon[0m           Abandon a revision
  [1m[32mabsorb[0m            Move changes from a revision into the stack of mutable revisions
  [1m[32mbisect[0m            Find a bad revision by bisection
  [1m[32mbookmark[0m          Manage bookmarks [default alias: b]
  [1m[32mcommit[0m            Update the description and create a new change on top [default alias: ci]
  [1m[32mconfig[0m            Manage config options
  [1m[32mdescribe[0m          Update the change description or other metadata [default alias: desc]
  [1m[32mdiff[0m              Compare file contents between two revisions
  [1m[32mdiffedit[0m          Touch up the content changes in a revision with a diff editor
  [1m[32mduplicate[0m         Create new changes with the same content as existing ones
  [1m[32medit[0m              Sets the specified revision as the working-copy revision
  [1m[32mevolog[0m            Show how a change has evolved over time [aliases: evolution-log]
  [1m[32mfile[0m              File operations
  [1m[32mfix[0m               Update files with formatting fixes or other changes
  [1m[32mgerrit[0m            Interact with Gerrit Code Review
  [1m[32mgit[0m               Commands for working with Git remotes and the underlying Git repo
  [1m[32mhelp[0m              Print this message or the help of the given subcommand(s)
  [1m[32minterdiff[0m         Compare the changes of two commits
  [1m[32mlog[0m               Show revision history
  [1m[32mmetaedit[0m          Modify the metadata of a revision without changing its content
  [1m[32mnew[0m               Create a new, empty change and (by default) edit it in the working copy
  [1m[32mnext[0m              Move the working-copy commit to the child revision
  [1m[32moperation[0m         Commands for working with the operation log [aliases: op]
  [1m[32mparallelize[0m       Parallelize revisions by making them siblings
  [1m[32mprev[0m              Change the working copy revision relative to the parent revision
  [1m[32mrebase[0m            Move revisions to different parent(s)
  [1m[32mredo[0m              Redo the most recently undone operation
  [1m[32mresolve[0m           Resolve conflicted files with an external merge tool
  [1m[32mrestore[0m           Restore paths from another revision
  [1m[32mrevert[0m            Apply the reverse of the given revision(s)
  [1m[32mroot[0m              Show the current workspace root directory (shortcut for `jj workspace root`)
  [1m[32mshow[0m              Show commit description and changes in a revision
  [1m[32msign[0m              Cryptographically sign a revision
  [1m[32msimplify-parents[0m  Simplify parent edges for the specified revision(s)
  [1m[32msparse[0m            Manage which paths from the working-copy commit are present in the working copy
  [1m[32msplit[0m             Split a revision in two
  [1m[32msquash[0m            Move changes from a revision into another revision
  [1m[32mstatus[0m            Show high-level repo status [default alias: st]
  [1m[32mtag[0m               Manage tags
  [1m[32mundo[0m              Undo the last operation
  [1m[32munsign[0m            Drop a cryptographic signature
  [1m[32mutil[0m              Infrequently used commands such as for generating shell completions
  [1m[32mversion[0m           Display version information
  [1m[32mworkspace[0m         Commands for working with workspaces

[1m[33mOptions:[0m
  [1m[32m-h[0m, [1m[32m--help[0m     Print help (see more with '--help')
  [1m[32m-V[0m, [1m[32m--version[0m  Print version

[1m[33mGlobal Options:[0m
  [1m[32m-R[0m, [1m[32m--repository[0m[32m [0m[32m<REPOSITORY>[0m      Path to repository to operate on
      [1m[32m--ignore-working-copy[0m          Don't snapshot the working copy, and don't update it
      [1m[32m--ignore-immutable[0m             Allow rewriting immutable commits
      [1m[32m--at-operation[0m[32m [0m[32m<AT_OPERATION>[0m  Operation to load the repo at [aliases: --at-op]
      [1m[32m--debug[0m                        Enable debug logging
      [1m[32m--color[0m[32m [0m[32m<WHEN>[0m                 When to colorize output [possible values: always, never, debug, auto]
      [1m[32m--quiet[0m                        Silence non-primary command output
      [1m[32m--no-pager[0m                     Disable the pager
      [1m[32m--config[0m[32m [0m[32m<NAME=VALUE>[0m          Additional configuration options (can be repeated)
      [1m[32m--config-file[0m[32m [0m[32m<PATH>[0m           Additional configuration files (can be repeated)
