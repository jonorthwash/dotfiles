" Vim syntax file
" Language: lexc/twolc
" Maintainer: Jonathan Washington
" Contributors: Brendan Malloy bbqsrc; Olexiy Savenkov
" Last Change: 2014-12-12
" Version: 0.3
 
" See http://wiki.apertium.org/wiki/Apertium-specific_conventions_for_lexc
" for more information about this dialect of lexc
 
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
 
" Keywords
syn keyword lexcLexicon LEXICON nextgroup=lexcLexiconB skipwhite
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

" Folding
syn clear lexcLexicon
syn keyword lexcLexicon LEXICON contained
syn region lexcFold
	\ start="a" start="b"
	\ end="b\@>" end="c\@>"
	\ transparent fold

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
hi def link lexcLexicon                 Statement
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
 
setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'LEXICON'\|\|getline(v:lnum)=~'Multichar_Symbols'?'>1':'='

let b:current_syntax = "lexc"
