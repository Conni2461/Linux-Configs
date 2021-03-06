local ts = require'nvim-treesitter.configs'
local parsers = require'nvim-treesitter.parsers'

vim.treesitter.set_query("lua", "folds", "")
vim.treesitter.set_query("lua", "indents", "")
vim.treesitter.set_query("lua", "locals", "")

ts.setup {
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<cr>",
      node_incremental = "<cr>",
      node_decremental = "<tab>",
      scope_incremental = "<s-cr>"
    }
  },
  indent = { enable = false },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
    smart_rename = { enable = false },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      }
    }
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false
  },
 query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  context_commentstring = {
    enable = true,
    config = {
      c = '// %s',
      lua = '-- %s'
    }
  },
  ensure_installed = { -- one of 'all', 'language' or a list of languages
    'bash',
    'bibtex',
    'c',
    'c_sharp',
    'clojure',
    'cmake',
    'comment',
    'cpp',
    'css',
    'fennel',
    'gdscript',
    'go',
    'graphql',
    'html',
    'java',
    'javascript',
    'json',
    'kotlin',
    'latex',
    'python',
    'ql',
    'query',
    'regex',
    'ruby',
    'rust',
    'rst',
    'teal',
    'toml',
    'typescript',
    'yaml'
  }
}

local configs = parsers.get_parser_configs()
local ft_str = table.concat(vim.tbl_map(function(ft) return configs[ft].filetype or ft end, parsers.available_parsers()), ',')
vim.cmd('autocmd Filetype ' .. ft_str .. ' setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()')
