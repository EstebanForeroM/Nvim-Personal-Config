return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local status, lualine = pcall(require, "lualine")
        if (not status) then return end

        local mode_colors = {
            n = '#50FA7B', -- Normal
            i = '#FF79C6', -- Insert
            v = '#BD93F9', -- Visual
            [''] = '#BD93F9', -- Visual Block
            V = '#BD93F9', -- Visual Line
            c = '#FF5555', -- Command
            no = '#8BE9FD', -- Operator-pending
            s = '#FF79C6', -- Select
            S = '#FF79C6', -- Select Line
            [''] = '#FF79C6', -- Select Block
            ic = '#F1FA8C', -- Insert completion
            R = '#FF5555', -- Replace
            Rv = '#FF5555', -- Visual Replace
            cv = '#FF5555', -- Vim Ex
            ce = '#FF5555', -- Normal Ex
            r = '#F1FA8C', -- Hit-Enter prompt
            rm = '#F1FA8C', -- More prompt
            ['r?'] = '#F1FA8C', -- Confirm prompt
            ['!'] = '#F1FA8C', -- Shell Running
            t = '#8BE9FD', -- Terminal
        }

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { 
                    { 'mode', 
                      color = function() 
                        return { fg = '#1E1E2E', bg = mode_colors[vim.fn.mode()] or '#50FA7B', gui = 'bold' } 
                      end 
                    } 
                },
                lualine_b = { 
                    { 'branch', color = { fg = '#50FA7B', bg = '#1E1E2E', gui = 'bold' } },
                    { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } }
                },
                lualine_c = { 
                    { 
                        'filename', 
                        file_status = true, 
                        path = 1, 
                        color = { fg = '#8BE9FD', bg = '#1E1E2E', gui = 'italic' } 
                    } 
                },
                lualine_x = {
                    { 
                        'diagnostics', 
                        sources = { "nvim_diagnostic" }, 
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                        color = { fg = '#FF5555', bg = '#1E1E2E' } 
                    },
                    { 'encoding', color = { fg = '#F1FA8C', bg = '#1E1E2E' } },
                    { 'filetype', color = { fg = '#BD93F9', bg = '#1E1E2E' } }
                },
                lualine_y = { 
                    { 'progress', color = { fg = '#50FA7B', bg = '#1E1E2E' } } 
                },
                lualine_z = { 
                    { 'location', color = { fg = '#FF79C6', bg = '#1E1E2E' } } 
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 
                    { 'filename', 
                      file_status = true, 
                      path = 1, 
                      color = { fg = '#8BE9FD', bg = '#282A36', gui = 'italic' } 
                    } 
                },
                lualine_x = { 
                    { 'location', color = { fg = '#F8F8F2', bg = '#282A36' } } 
                },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {'fugitive', 'quickfix'} 
        }       
    end
}

