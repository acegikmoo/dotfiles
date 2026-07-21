local api = vim.api
local fn = vim.fn

local STOP_KEYWORDS = { 'return', 'break', 'continue', 'raise', 'pass' }

local OPEN_MAP = { [')'] = '(', [']'] = '[', ['}'] = '{' }

local function hanging_after_stop_stmt(lnum)
  local plnum = fn.prevnonblank(lnum - 1)
  if plnum == 0 then
    return false
  end
  local line = (api.nvim_buf_get_lines(0, plnum - 1, plnum, false)[1] or '')
  local trimmed = line:match('^%s*(.*)')
  for _, kw in ipairs(STOP_KEYWORDS) do
    if trimmed:sub(1, #kw) == kw then
      local after = trimmed:sub(#kw + 1)
      if after == '' or after:match('^%s') or after:match('^[%[%(]') then
        local stripped = trimmed:gsub('#.*$', ''):gsub('%s+$', '')
        if stripped:match('[([{]%s*$') then
          return true
        end
      end
    end
  end
  return false
end

local function closing_bracket_indent(lnum, first_nonblank)
  local close_ch = first_nonblank:sub(1, 1)
  local open_ch = OPEN_MAP[close_ch]
  if not open_ch then
    return nil
  end
  local view = fn.winsaveview()
  api.nvim_win_set_cursor(0, {lnum, 0})
  local ok, result = pcall(fn.searchpairpos,
    '[' .. open_ch .. ']',
    '',
    '[' .. close_ch .. ']',
    'bW'
  )
  fn.winrestview(view)
  if ok and result and result[1] > 0 then
    return fn.indent(result[1])
  end
  return nil
end

return {
  get_indent = function()
    local lnum = vim.v.lnum
    local line = api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1] or ''
    local trimmed = line:match('^%s*(.*)')

    local ci = closing_bracket_indent(lnum, trimmed)
    if ci ~= nil then
      return ci
    end

    if hanging_after_stop_stmt(lnum) then
      local plnum = fn.prevnonblank(lnum - 1)
      return fn.indent(plnum) + fn.shiftwidth()
    end

    return fn['python#GetIndent'](lnum)
  end,
}
