

-module(mill_transform).

-export([parse_transform/2]).

parse_transform(Args1, Args2) ->
    io:format("----->  parse_transform:~p :~p~n", [Args1, Args2]).

