%% =============================================================================
%%  Copyright (c) 2013.
%% =============================================================================

-module(little_gc_task).
-include("ecrontab.hrl").
-export([run/1]).

run(N) ->
    io:format("test run the routine by cron server:~p~n", [N]).
