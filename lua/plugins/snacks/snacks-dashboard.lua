return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      enabled = true,
      width = 80,
      sections = {
        function()
          local is_git = Snacks.git.get_root() ~= nil
          local is_wide = vim.o.columns >= 160

          -- Render ASCII art via a terminal section so lines aren't auto-centered individually
          local header_section = {
            section = "terminal",
            cmd = [[printf "\033[33m                    ,--.                  \n                   `.`_.`\\                \n                        \\ \\               \n                         \\ \\              \n                          \\ \\             \n                           \\ `-''^^^^^''-.\n                            \\             `-._\n                            >>   >  <  <__    ^'-----...,,_\n                           //__/`---'\\__\\\\\`'\"\"\"\"'\"'\"'\"'''''``\n                          `\"`\"\"      `\"\"`\"                  \033[0m\n"]],
            height = 10,
            padding = 1,
            indent = 0,
          }

          -- 1. Wide screen + Git repo (2 Panes)
          if is_wide and is_git then
            return {
              -- Pane 1 (Left)
              header_section,
              {
                pane = 1,
                icon = " ",
                title = "Recent Files",
                section = "recent_files",
                indent = 1,
                padding = 1,
                limit = 5,
              },
              {
                pane = 1,
                section = "terminal",
                title = "Project TODOs",
                icon = "󰄬 ",
                cmd = [[bash -c "rg --vimgrep 'TODO:|FIXME:|HACK:' -g '!*.lua' | head -n 8 | awk -F: '{n=split(\$1,a,\"/\"); short=a[n-1]\"/\"a[n]; msg=\"\"; for(i=4;i<=NF;i++) msg=msg (i>4?\":\":\"\")\$i; sub(/^[ ]+/,\"\",msg); line=\"  \033[36m\" short \"\033[0m \" msg; print substr(line,1,78)}'"]],
                height = 8,
                padding = 1,
                ttl = 0,
                cache = false,
              },
              { pane = 1, section = "startup" },

              -- Pane 2 (Right)
              {
                pane = 2,
                section = "terminal",
                cmd = [[printf ""]],
                height = 10,
                padding = 1,
              },
              {
                pane = 2,
                section = "terminal",
                cmd = [[printf "\033[35m󱉭 Current Project: \033[0m\033[1m\033[36m$(basename $(git rev-parse --show-toplevel 2>/dev/null || pwd))\033[0m\n"]],
                height = 1,
                padding = { 1, 0 },
                cache = false,
                ttl = 0,
                indent = 3,
              },
              {
                pane = 2,
                section = "terminal",
                icon = " ",
                title = "Git Status",
                cmd = [[bash -c 's=$(git diff --stat=50 --stat-graph-width=15 -B -M -C --color=always); if [ -z "$s" ]; then echo -e "  \033[32m󰄬 \033[0m \033[35mUp to date\033[0m"; else echo "$s"; fi']],
                height = 6,
                padding = 1,
                cache = false,
                ttl = 0,
                indent = 3,
              },
              {
                pane = 2,
                section = "terminal",
                title = "Commits History",
                icon = "⎇ ",
                cmd = [[bash -c 'git log --graph --all --color=always -n 8 --format='"'"'@%at@%s'"'"' | jq -R -r '"'"'if contains("@") then split("@") as $parts | $parts[0] as $graph | ($parts[1]|tonumber) as $t | $parts[2] as $s | (now - $t) as $diff | (if $diff < 3600 then "\(($diff/60|floor))m" elif $diff < 86400 then "\(($diff/3600|floor))h" elif $diff < 604800 then "\(($diff/604800|floor))d" elif $diff < 2592000 then "\(($diff/2592000|floor))mo" end) as $time | $graph + "\u001b[35m" + ($time + (" " * (5 - ($time|length)))) + "\u001b[0m " + $s else . end'"'"' | cut -c 1-78']],
                height = 8,
                padding = 1,
                cache = false,
                ttl = 0,
                indent = 3,
              },
              {
                pane = 2,
                section = "terminal",
                title = "Open Issues",
                icon = " ",
                cmd = [[bash -c 'export PATH="/opt/homebrew/bin:$PATH"; GH_FORCE_TTY=100% gh issue list -L 5 --json updatedAt,number,title --template '"'"'{{range .}}{{.updatedAt}}@{{.number}}@{{.title}}{{"\n"}}{{end}}'"'"' | jq -R -r '"'"'split("@") as $parts | ($parts[0] | fromdateiso8601) as $t | $parts[1] as $n | $parts[2] as $s | (now - $t) as $d | (if $d < 3600 then "\(($d/60|floor))m" elif $d < 86400 then "\(($d/86400|floor))h" elif $d < 604800 then "\(($d/2592000|floor))w" else "\(($d/2592000|floor))mo" end) as $time | "\u001b[35m  " + ($time + (" " * (3 - ($time|length)))) + " #" + $n + "\u001b[0m " + $s'"'"' | cut -c 1-78']],
                height = 4,
                padding = 1,
                cache = false,
                ttl = 0,
                indent = 3,
              },
            }
          end

          -- 2. Wide screen + Non-Git repo
          if is_wide and not is_git then
            return {
              header_section,
              {
                icon = " ",
                title = "Recent Files",
                section = "recent_files",
                indent = 1,
                padding = 1,
                limit = 5,
              },
              {
                section = "terminal",
                title = "Project TODOs",
                icon = "󰄬 ",
                cmd = [[bash -c "rg --vimgrep 'TODO:|FIXME:|HACK:' -g '!*.lua' | head -n 8 | awk -F: '{n=split(\$1,a,\"/\"); short=a[n-1]\"/\"a[n]; msg=\"\"; for(i=4;i<=NF;i++) msg=msg (i>4?\":\":\"\")\$i; sub(/^[ ]+/,\"\",msg); line=\"  \033[36m\" short \"\033[0m \" msg; print substr(line,1,78)}'"]],
                height = 8,
                padding = 1,
                ttl = 0,
                cache = false,
              },
              { section = "startup" },
            }
          end

          -- 3. Slim screen (< 160 columns)
          return {
            header_section,
            {
              icon = " ",
              title = "Recent Files",
              section = "recent_files",
              indent = 1,
              padding = 1,
              limit = 5,
            },
            {
              section = "terminal",
              title = "Project TODOs",
              icon = "󰄬 ",
              cmd = [[bash -c "rg --vimgrep 'TODO:|FIXME:|HACK:' -g '!*.lua' | head -n 5 | awk -F: '{n=split(\$1,a,\"/\"); short=a[n-1]\"/\"a[n]; msg=\"\"; for(i=4;i<=NF;i++) msg=msg (i>4?\":\":\"\")\$i; sub(/^[ ]+/,\"\",msg); line=\"  \033[36m\" short \"\033[0m \" msg; print substr(line,1,60)}'"]],
              height = 5,
              padding = 1,
              ttl = 0,
              cache = false,
            },
            { section = "startup" },
          }
        end,
      },
    },
  },
}
