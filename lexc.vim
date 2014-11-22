" Vim syntax file
" Language: lexc/twolc
" Maintainer: Jonathan Washington
" Contributors: Brendan Malloy bbqsrc
" Last Change: 2014-09-28
" Version: 0.2
 
 
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
 
" Keywords
syn keyword lexcLabel Multichar_Symbols
"syn keyword lexcLexicon LEXICON nextgroup=lexcLexiconB skipwhite
"syn region lexcLexicon start="LEXICON" end="LEXICON"re=s-1 skipwhite transparent fold keepend
syn region lexcLexicon start="LEXICON" end="LEXICON" fold
syn match lexcLexiconLine "LEXICON .*$" contains=lexcLexiconKeyword,lexcLexiconB
syn keyword lexcLexiconKeyword LEXICON contained
syn match lexcLexiconB "[a-zA-ZА-ЯӐ-ӲҪÁ-Úá-ú_\-][a-zA-ZА-ЯӐ-ӲҪÁ-Úá-ú0-9_\-]*" contained
syn match lexcLexiconB "[\#\_]"
 
" Identifiers
syn match lexcFlagDiacritic   "@[^@][^@]*@"
 
" Symbols
syn match lexcSymbol +\\["'\\]+ contained
syn match lexcSymbol "[\:]"
 
" Comment
syn match lexcComment "\!.*$"
 
" Operators
syn match lexcOperator "[\.\*\+\?|\\\^]"
syn match lexcEscapedChar "%."
syn match lexcApertiumMorphBoundary "%>"

syn keyword lexcTodo contained TODO FIXME CHECK NOTE BUG

syn match lexcApertiumSpecial contained "Dir\/[LR][LR]"
syn match lexcApertiumSpecial contained "Use\/MT"

syn match lexcComment "\!.*$" contains=lexcApertiumSpecial,lexcTodo

" More Identifiers
" This stuff needs to come after the lexcEscapedChar

syn match lexcApertiumLeftBrackets "%[{<\[]"
syn match lexcApertiumRightBrackets "%[}>\]]"

syn match lexcApertiumMC "%[<{\[].\{-}%[>}\]]"hs=s+2,he=e-2 contains=lexcApertiumLeftBrackets,lexcApertiumRightBrackets

 
hi def link lexcLabel                   Label
hi def link lexcLexiconKeyword          Statement
hi def link lexcLexiconLine             Label
hi def link lexcLexiconB                Function
hi def link lexcComment                 Comment
hi def link lexcOperator                Operator
hi def link lexcFlagDiacritic           Identifier
hi def link lexcString                  String
hi def link lexcSymbol                  String
hi def link lexcTodo                    Todo
hi def link lexcPointer                 Operator
hi def link lexcEscapedChar             Delimiter

" Apertium-specific stuff
hi def link lexcApertiumMorphBoundary   String
hi def link lexcApertiumSpecial         PreCondit
hi def link lexcApertiumLeftBrackets    Delimiter
hi def link lexcApertiumRightBrackets   Delimiter
hi def link lexcApertiumMC              Label

"hi def link lexcArchiphoneme    Label
"hi def link lexcTag             Identifier
"hi def link lexcFeature         Identifier
"hi def link lexcBrackets        Delimiter

 
setlocal foldmethod=syntax 
"setlocal foldlevel=20

let b:current_syntax = "lexc"
