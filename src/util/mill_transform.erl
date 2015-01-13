

-module(mill_transform).

-export([parse_transform/2]).

parse_transform([File, Module|Forms], _) ->
    NewForms = replace_or_author(Forms),
    [File, Module|NewForms].


replace_or_author(Forms) ->
    lists:flatten([replace(Form) || Form <- Forms]).

replace({attribute, Line, author, _Ori}) ->
    {attribute, Line, author, 'eric.yutao'};
replace(Other) -> Other.

