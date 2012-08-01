% ----------------------------------------------------------------------
%
%  eXAT, an erlang eXperimental Agent Tool
%  Copyright (C) 2005-07 Corrado Santoro (csanto@diit.unict.it)
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <http://www.gnu.org/licenses/>
%
%
%
%
%

Nonterminals list elements elem acl slot slotterm term
integer wsp number numbers letter upcase_letter lowcase_letter
string stringterm stringterms
quotedstring astringterms
achar
vcharstring vchar vcharstringterms
symbol
.


Terminals
'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N'
'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'
'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n'
'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'
'0' '1' '2' '3' '4' '5' '6' '7' '8' '9'
'$' '*' '/' '@' ' ' '\n' '\r'
'!' '"' '#' '%' '&' '\'' '(' ')' '+' ',' '-' '.' ':'
';' '<' '=' '>' '?' '[' '\\' ']' '^' '_' '{' '|' '}' '~'
'\\\\' .

Rootsymbol acl.


acl -> list : '$1'.

list -> '(' ')' : [ ].
%list -> '(' wsp ')' : [ ].
list -> '(' elements ')' : '$2'.
list -> '(' wsp elements ')' : '$3'.
list -> '(' elements wsp ')' : '$2'.
list -> '(' wsp elements wsp ')' : '$3'.

elements -> elem : ['$1'].
elements -> elem wsp : ['$1'].
elements -> elem wsp elements : ['$1'] ++ '$3'.

elem -> term : '$1'.
elem -> list : '$1'.
elem -> slot : '$1'.
slot -> ':' term wsp slotterm : { binary_to_atom ('$2', latin1), '$4'}.
slotterm -> '"' quotedstring '"' : '$2'.
slotterm -> term : '$1'.
slotterm -> list : '$1'.

term -> vcharstring : '$1'.

wsp -> ' '.
wsp -> ' ' wsp.

integer -> numbers : http_server:terms_to_integer ('$1').
numbers -> number numbers : [ '$1' | '$2' ].
numbers -> number : ['$1'].

string -> stringterms : http_server:terms_to_string ('$1').
stringterms -> stringterm stringterms : [ '$1' | '$2' ].
stringterms -> stringterm : ['$1'].

stringterm -> letter : '$1'.
stringterm -> number : '$1'.
stringterm -> '-' : '$1'.
stringterm -> '@' : '$1'.

vcharstring -> vcharstringterms : http_server:terms_to_string ('$1').
vcharstringterms -> vchar vcharstringterms : [ '$1' | '$2' ].
vcharstringterms -> vchar : ['$1'].

quotedstring -> astringterms : http_server:terms_to_string ('$1').
astringterms -> achar astringterms : [ '$1' | '$2' ].
astringterms -> achar : ['$1'].

achar -> vchar : '$1'.
achar -> ' ' : '$1'.
achar -> '*' : '$1'.
achar -> '$' : '$1'.
achar -> '(' : '$1'.
achar -> ')' : '$1'.
achar -> '\\\\' '"' : '$2'.

vchar -> letter : '$1'.
vchar -> number : '$1'.
vchar -> symbol : '$1'.
vchar -> '@' : '$1'.

%eol -> '\r' '\n'.

letter -> upcase_letter : '$1'.
letter -> lowcase_letter : '$1'.

symbol -> '!' : '$1'.
%symbol -> '"' : '$1'.
symbol -> '#' : '$1'.
symbol -> '%' : '$1'.
symbol -> '&' : '$1'.
symbol -> '\'' : '$1'.
symbol -> '+' : '$1'.
symbol -> ',' : '$1'.
symbol -> '-' : '$1'.
symbol -> '/' : '$1'.
symbol -> '.' : '$1'.
symbol -> ':' : '$1'.
symbol -> ';' : '$1'.
symbol -> '<' : '$1'.
symbol -> '=' : '$1'.
symbol -> '>' : '$1'.
symbol -> '?' : '$1'.
symbol -> '[' : '$1'.
symbol -> '\\' : '$1'.
symbol -> ']' : '$1'.
symbol -> '^' : '$1'.
symbol -> '_' : '$1'.
symbol -> '{' : '$1'.
symbol -> '|' : '$1'.
symbol -> '}' : '$1'.
symbol -> '~' : '$1'.

upcase_letter -> 'A' : '$1'.
upcase_letter -> 'B' : '$1'.
upcase_letter -> 'C' : '$1'.
upcase_letter -> 'D' : '$1'.
upcase_letter -> 'E' : '$1'.
upcase_letter -> 'F' : '$1'.
upcase_letter -> 'G' : '$1'.
upcase_letter -> 'H' : '$1'.
upcase_letter -> 'I' : '$1'.
upcase_letter -> 'J' : '$1'.
upcase_letter -> 'K' : '$1'.
upcase_letter -> 'L' : '$1'.
upcase_letter -> 'M' : '$1'.
upcase_letter -> 'N' : '$1'.
upcase_letter -> 'O' : '$1'.
upcase_letter -> 'P' : '$1'.
upcase_letter -> 'Q' : '$1'.
upcase_letter -> 'R' : '$1'.
upcase_letter -> 'S' : '$1'.
upcase_letter -> 'T' : '$1'.
upcase_letter -> 'U' : '$1'.
upcase_letter -> 'V' : '$1'.
upcase_letter -> 'W' : '$1'.
upcase_letter -> 'X' : '$1'.
upcase_letter -> 'Y' : '$1'.
upcase_letter -> 'Z' : '$1'.
lowcase_letter -> 'a' : '$1'.
lowcase_letter -> 'b' : '$1'.
lowcase_letter -> 'c' : '$1'.
lowcase_letter -> 'd' : '$1'.
lowcase_letter -> 'e' : '$1'.
lowcase_letter -> 'f' : '$1'.
lowcase_letter -> 'g' : '$1'.
lowcase_letter -> 'h' : '$1'.
lowcase_letter -> 'i' : '$1'.
lowcase_letter -> 'j' : '$1'.
lowcase_letter -> 'k' : '$1'.
lowcase_letter -> 'l' : '$1'.
lowcase_letter -> 'm' : '$1'.
lowcase_letter -> 'n' : '$1'.
lowcase_letter -> 'o' : '$1'.
lowcase_letter -> 'p' : '$1'.
lowcase_letter -> 'q' : '$1'.
lowcase_letter -> 'r' : '$1'.
lowcase_letter -> 's' : '$1'.
lowcase_letter -> 't' : '$1'.
lowcase_letter -> 'u' : '$1'.
lowcase_letter -> 'v' : '$1'.
lowcase_letter -> 'w' : '$1'.
lowcase_letter -> 'x' : '$1'.
lowcase_letter -> 'y' : '$1'.
lowcase_letter -> 'z' : '$1'.
number -> '0' : '$1'.
number -> '1' : '$1'.
number -> '2' : '$1'.
number -> '3' : '$1'.
number -> '4' : '$1'.
number -> '5' : '$1'.
number -> '6' : '$1'.
number -> '7' : '$1'.
number -> '8' : '$1'.
number -> '9' : '$1'.
