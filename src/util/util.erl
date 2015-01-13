
-module(util).

-export([parse_string/1]).
-export([parse_string_list_without_zero/1]).

-record(test, {a, b=default}).

-author('eric.yu').

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

test() ->
    -1,
    "abcdefg".

parse_string(String) when is_list(String) ->
    parse_string(String, []).

parse_string([], Acc) -> string:join(lists:reverse(Acc), "");
parse_string([C|Rest], Acc) when C > 0, C =< 127 ->
    parse_string(Rest, io_lib:format("~c", [C])++Acc);
parse_string([_|Rest], Acc) ->
    parse_string(Rest, Acc).


parse_string_list_without_zero(String) when is_list(String) ->
    FilterZero = [C || C<-String, C=/=0],
    FilterZero.


-ifdef(TEST).
parse_string_test_() ->
    [
        ?_assertEqual("llcx", parse_string([108,108,99,120,0,0,0,0,0,0,0,0,0,0,0,0])),
        ?_assertEqual("2015-01-04 16:10:13", parse_string([50,48,49,53,45,48,49,45,48,52,32,49,54,58,49,48,58,49,51,0])),
        ?_assertEqual("llcx", parse_string_list_without_zero([108,108,99,120,0,0,0,0,0,0,0,0,0,0,0,0])),
        ?_assertEqual("2015-01-04 16:10:13", parse_string_list_without_zero([50,48,49,53,45,48,49,45,48,52,32,49,54,58,49,48,58,49,51,0]))
    ].
-endif.
