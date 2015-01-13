
%% mill redis cache module
-module(mill_cache).

-include("mill.hrl").

-export([start/0]).

-export([get/2, mget/2, put/3, mput/2]).


start() ->
    Host = mill_config:get("redis_server", "host"),
    Port = mill_config:get("redis_server", "port"),
    Pass = mill_config:get("redis_server", "pass"),
    Count= mill_config:get("redis_server", "count"),
    Options = [
        {ip,        Host},
        {port,      Port},
        {pass,      Pass},
        {count,     Count}
    ],
    reddy_pool:new_pool(?MILL_POOL, Options).


%% cahce operator functions
%%
%%
get(Pool, Key) ->
    reddy_strings:get(Pool, Key).

mget(Pool, Keys) ->
    reddy_strings:mget(Pool, Keys).


put(Pool, Key, Value) ->
    reddy_strings:set(Pool, Key, Value).

mput(Pool, KeyValues) ->
    reddy_strings:mset(Pool, KeyValues).
