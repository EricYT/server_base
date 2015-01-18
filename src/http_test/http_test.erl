

-module(http_test).

-export([run/5]).

run(Url, Method, Hdrs, Body, Timeout) ->
    Res = lhttpc:request(Url, Method, Hdrs, Body, Timeout),
    io:format("-------> response:~p~n", [Res]),
    ok.
