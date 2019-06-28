" Vim syntax file
" Language:     Org-mode TODO (ish)
" Maintainer:   Tim Segers <tsegers@pm.me>
" Copyright:    2017 Tim Segers
" License:      MIT http://opensource.org/licenses/MIT
" Last Change:  2018-08-20
" Filenames:    notes
"
if exists("b:current_syntax")
  finish
endif

" org heading
syn region todoHeader       start="^\*\+" end="$"

hi link todoHeader          todoBold

" todo statuses
syn keyword todoDoing       DOING containedin=todoHeader
syn keyword todoDone        DONE  containedin=todoHeader
syn keyword todoNope        NOPE  containedin=todoHeader
syn keyword todoTodo        TODO  containedin=todoHeader
syn keyword todoWait        WAIT  containedin=todoHeader

hi link todoDoing           Identifier
hi link todoDone            Constant
hi link todoNope            Comment
hi link todoTodo            Todo
hi link todoWait            Error

" todo checkboxes
syn match todoCbDelegated   "\[d\]"
syn match todoCbDoing       "\[\-\]"
syn match todoCbDone        "\[x\]"
syn match todoCbNope        "\[n\]"
syn match todoCbTodo        "\[ \]"
syn match todoCbWait        "\[w\]"

hi link todoCbDelegated     Special
hi link todoCbDoing         Identifier
hi link todoCbDone          Constant
hi link todoCbNope          Comment
hi link todoCbTodo          Todo
hi link todoCbWait          Error

" todo planning
syn match todoDeadline      /^DEADLINE .*/
syn match todoScheduled     /^SCHEDULED .*/
syn match todoClosed        /^CLOSED .*/

hi link todoDeadline        Special
hi link todoScheduled       Constant
hi link todoClosed          Underlined
hi link todoDate            Underlined

" org affiliated keywords
syn match todoAffil         /#+\S\+:.*/

hi link todoAffil           Comment

" org blocks
syn match todoBlockDelim    /#+BEGIN_.*/
syn match todoBlockDelim    /#+END_.*/
syn region todoBlock        start="#+BEGIN_.*" end="#+END_.*" keepend contains=todoBlockDelim

hi link todoBlockDelim      Comment
hi link todoBlock           String

" custom blocks
syn region todoAlert        start="!!!" end="!!!"
syn region todoVerb         start="```" end="```"

hi link todoAlert           Special
hi link todoVerb            String

" org lists
syn match todoList          "^\(\s*[-+]\|\s\+\*\)\(\s\|$\)" nextgroup=todoListItem
syn match todoList          "^\s*\(\a\|\d\+\)[.)]\(\s\|$\)" nextgroup=todoListItem

syn match todoListItem      /.*$/ contained contains=todoLink,todoCbDelegated,todoCbDoing,todoCbDone,todoCbNope,todoCbTodo,todoCbWait

hi link todoList            todoBold
hi link todoListItem        Normal
hi link todoDef             todoBold

" urls
syn match todoLinkOpen      "\[\[" containedin=todoLink conceal
syn match todoLinkClose     "\]\]" containedin=todoLink conceal
syn match todoLinkURL       "[^][]*\]\[" containedin=todoLink conceal
syn match todoLink          "\[\[[^][]*\]\[[^][]*\]\]"

hi link todoLink            Underlined

" extra defs
hi def todoBold             term=bold cterm=bold gui=bold

