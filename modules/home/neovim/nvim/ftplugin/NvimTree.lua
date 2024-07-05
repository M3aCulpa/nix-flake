-- Remove word wrap fix inside of nvim-tree to prevent stuttering.
vim.keymap.set('n', 'k', "'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "'j'", { expr = true, silent = true })

local bind = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = true, silent = true, nowait = true, noremap = true, desc = desc })
end

local api = require('nvim-tree.api')

bind('<C-]>',   api.tree.change_root_to_node,        'Nvim-Tree: CD' )
bind('<C-e>',   api.node.open.replace_tree_buffer,   'Nvim-Tree: Open: In Place' )
bind('<C-k>',   api.node.show_info_popup,            'Nvim-Tree: Info' )
bind('<C-r>',   api.fs.rename_sub,                   'Nvim-Tree: Rename: Omit Filename' )
bind('<C-t>',   api.node.open.tab,                   'Nvim-Tree: Open: New Tab' )
bind('<C-v>',   api.node.open.vertical,              'Nvim-Tree: Open: Vertical Split' )
bind('<C-x>',   api.node.open.horizontal,            'Nvim-Tree: Open: Horizontal Split' )
bind('<BS>',    api.node.navigate.parent_close,      'Nvim-Tree: Close Directory' )
bind('<CR>',    api.node.open.edit,                  'Nvim-Tree: Open' )
bind('<Tab>',   api.node.open.preview,               'Nvim-Tree: Open Preview' )
bind('>',       api.node.navigate.sibling.next,      'Nvim-Tree: Next Sibling' )
bind('<',       api.node.navigate.sibling.prev,      'Nvim-Tree: Previous Sibling' )
bind('.',       api.node.run.cmd,                    'Nvim-Tree: Run Command' )
bind('-',       api.tree.change_root_to_parent,      'Nvim-Tree: Up' )
bind('a',       api.fs.create,                       'Nvim-Tree: Create File Or Directory' )
bind('bd',      api.marks.bulk.delete,               'Nvim-Tree: Delete Bookmarked' )
bind('bt',      api.marks.bulk.trash,                'Nvim-Tree: Trash Bookmarked' )
bind('bmv',     api.marks.bulk.move,                 'Nvim-Tree: Move Bookmarked' )
bind('B',       api.tree.toggle_no_buffer_filter,    'Nvim-Tree: Toggle Filter: No Buffer' )
bind('c',       api.fs.copy.node,                    'Nvim-Tree: Copy' )
bind('C',       api.tree.toggle_git_clean_filter,    'Nvim-Tree: Toggle Filter: Git Clean' )
bind('[c',      api.node.navigate.git.prev,          'Nvim-Tree: Prev Git' )
bind(']c',      api.node.navigate.git.next,          'Nvim-Tree: Next Git' )
bind('d',       api.fs.remove,                       'Nvim-Tree: Delete' )
bind('D',       api.fs.trash,                        'Nvim-Tree: Trash' )
bind('E',       api.tree.expand_all,                 'Nvim-Tree: Expand All' )
bind('e',       api.fs.rename_basename,              'Nvim-Tree: Rename: Basename' )
bind(']e',      api.node.navigate.diagnostics.next,  'Nvim-Tree: Next Diagnostic' )
bind('[e',      api.node.navigate.diagnostics.prev,  'Nvim-Tree: Prev Diagnostic' )
bind('F',       api.live_filter.clear,               'Nvim-Tree: Live Filter: Clear' )
bind('f',       api.live_filter.start,               'Nvim-Tree: Live Filter: Start' )
bind('g?',      api.tree.toggle_help,                'Nvim-Tree: Help' )
bind('gy',      api.fs.copy.absolute_path,           'Nvim-Tree: Copy Absolute Path' )
bind('ge',      api.fs.copy.basename,                'Nvim-Tree: Copy Basename' )
bind('H',       api.tree.toggle_hidden_filter,       'Nvim-Tree: Toggle Filter: Dotfiles' )
bind('I',       api.tree.toggle_gitignore_filter,    'Nvim-Tree: Toggle Filter: Git Ignore' )
bind('J',       api.node.navigate.sibling.last,      'Nvim-Tree: Last Sibling' )
bind('K',       api.node.navigate.sibling.first,     'Nvim-Tree: First Sibling' )
bind('L',       api.node.open.toggle_group_empty,    'Nvim-Tree: Toggle Group Empty' )
bind('M',       api.tree.toggle_no_bookmark_filter,  'Nvim-Tree: Toggle Filter: No Bookmark' )
bind('m',       api.marks.toggle,                    'Nvim-Tree: Toggle Bookmark' )
bind('o',       api.node.open.edit,                  'Nvim-Tree: Open' )
bind('O',       api.node.open.no_window_picker,      'Nvim-Tree: Open: No Window Picker' )
bind('p',       api.fs.paste,                        'Nvim-Tree: Paste' )
bind('P',       api.node.navigate.parent,            'Nvim-Tree: Parent Directory' )
bind('q',       api.tree.close,                      'Nvim-Tree: Close' )
bind('r',       api.fs.rename,                       'Nvim-Tree: Rename' )
bind('R',       api.tree.reload,                     'Nvim-Tree: Refresh' )
bind('s',       api.node.run.system,                 'Nvim-Tree: Run System' )
bind('S',       api.tree.search_node,                'Nvim-Tree: Search' )
bind('u',       api.fs.rename_full,                  'Nvim-Tree: Rename: Full Path' )
bind('U',       api.tree.toggle_custom_filter,       'Nvim-Tree: Toggle Filter: Hidden' )
bind('W',       api.tree.collapse_all,               'Nvim-Tree: Collapse' )
bind('x',       api.fs.cut,                          'Nvim-Tree: Cut' )
bind('y',       api.fs.copy.filename,                'Nvim-Tree: Copy Name' )
bind('Y',       api.fs.copy.relative_path,           'Nvim-Tree: Copy Relative Path' )
