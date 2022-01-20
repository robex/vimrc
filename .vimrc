:set autoindent
:set nu

:set tabstop=8
filetype plugin on
":set colorcolumn=80

:nnoremap t :tabnext<CR>
:nnoremap T :tabprevious<CR>
map [ o<esc>I

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
"if has('persistent_undo')
    "let myUndoDir = expand(vimDir . '/undodir')
    "" Create dirs
    "call system('mkdir ' . vimDir)
    "call system('mkdir ' . myUndoDir)
    "let &undodir = myUndoDir
    "set undofile
"endif

" Open multiple tabs at once
fun! OpenMultipleTabs(pattern_list)
    for p in a:pattern_list
        for c in glob(l:p, 0, 1)
            execute 'tabedit ' . l:c
        endfor
    endfor
endfun

command! -bar -bang -nargs=+ -complete=file Tabe call OpenMultipleTabs([<f-args>])
