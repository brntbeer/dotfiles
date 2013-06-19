" first clear any existing autocommands:
autocmd!
set nocompatible

" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

" use "[RO]" for "[readonly]" to save space in the message line:
set shortmess+=r

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" when using list, keep tabs at their full width and display `arrows':
" execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)
" (Character 187 is a right double-chevron, and 183 a mid-dot.)

" have the mouse enabled all the time:
set mouse=a

" don't have files trying to override this .vimrc:
set nomodeline


" normally don't automatically format `text' as it is typed, IE only do this
" with comments, at 79 characters:
set formatoptions-=t
set textwidth=79

" get rid of the default style of C comments, and define a style with two stars
" at the start of `middle' rows which (looks nicer and) avoids asterisks used
" for bullet lists being treated like C comments; then define a bullet list
" style for single stars (like already is for hyphens):
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:**,ex:*/
set comments+=fb:*

" treat lines starting with a quote mark as comments (for `Vim' files, such as
" this very one!), and colons as well so that reformatting usenet messages from
" `Tin' users works OK:
set comments+=b:\"
set comments+=n::

" * Text Formatting -- Specific File Formats

" enable filetype detection:
filetype on
filetype indent on
filetype plugin on

" recognize anything in my .Postponed directory as a news article, and anything
" at all with a .txt extension as being human-language text [this clobbers the
" `help' filetype, but that doesn't seem to prevent help from working
" properly]:
augroup filetype
  autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
  autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END

" for Processing:
autocmd BufNewFile,BufRead *.pde set filetype=java

" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

"For markdown, bitches.
autocmd BufNewFile,BufRead *.md set filetype=markdown

" * Search & Replace

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" assume the /g flag on :s substitutions to replace all matches in a line:
set gdefault


" * Spelling

" define `Ispell' language and personal dictionary, used in several places
" below:
let IspellLang = 'english'
let PersonalDict = '~/.ispell_' . IspellLang

" try to avoid misspelling words in the first place -- have the insert mode
" <Ctrl>+N/<Ctrl>+P keys perform completion on partially-typed words by
" checking the Linux word list and the personal `Ispell' dictionary; sort out
" case sensibly (so that words at starts of sentences can still be completed
" with words that are in the dictionary all in lower case):
execute 'set dictionary+=' . PersonalDict
set dictionary+=/usr/dict/words
set complete=.,w,k
set infercase

" have % bounce between angled brackets, as well as t'other kinds:
set matchpairs+=<:>

" * Keystrokes -- Formatting


set statusline=%<%f%h%m%r%=%{strftime(\"%I:%M:%S\ \%p,\ %a\ %b\ %d,\ %Y\")}\ \ \|\ \ %{&ff}\ %l,%c%V\ %P\ \ 
set laststatus=2

augroup filetype
  autocmd BufNewFile,BufRead *.rhtml set filetype=html
  autocmd BufNewFile,BufRead *.rake set filetype=ruby
  autocmd BufNewFile,BufRead Gemfile* set filetype=ruby
  autocmd BufNewFile,BufRead *.ru set filetype=ruby
  autocmd BufNewFile,BufRead Capfile set filetype=ruby
augroup END

autocmd BufNewFile,BufRead *.pde set filetype=java
autocmd BufNewFile,BufRead *.scala set filetype=scala
autocmd BufNewFile,BufRead *.haml set filetype=haml
autocmd BufNewFile,BufRead *.sass set filetype=sass
autocmd BufNewFile,BufRead *.io set filetype=io


" show line numbers
set nu

set binary noeol
set backspace=indent,eol,start
set showmatch

highlight WhitespaceEOL ctermbg=lightgray guibg=lightgray
match WhitespaceEOL /s+$/

" * Text Formatting -- General

set et                     " when hitting tab key, put spaces
set sw=2                   " soft width
set ts=2                   " tabstop
set backspace=2            " allow backspacing over everything in insert mode

" don't make it look like there are line breaks where there aren't:
set nowrap
" use indents of 2 spaces, and have them copied down lines:
set autoindent

" Display extra whitespace
set list listchars=tab:»·,trail:·




let rdark_current_line = 1
set background=dark
colorscheme evening
"colorscheme ir_black
set guifont=Monaco:h12


command! Untab %s/\t/  /

" Never create swap files!
set updatecount=0

" Remove the toolbar for macvim
set guioptions-=T

" processing
let processing_doc_path="/Applications/Processing.app/Contents/Resources/Java/reference"

" peepopen
map ,p :PeepOpen <CR> 

" pathogen wtfever
call pathogen#infect()
