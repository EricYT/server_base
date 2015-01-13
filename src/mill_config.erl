

%% mill config file
%%
%%
-module(mill_config).

-export([get/2]).


-spec get(Key1, Key2) -> Value when
    Key1 :: string(),
    Key2 :: string(),
    Value :: any().
%% redis config
get("redis_server", "host") ->
    "127.0.0.1";
get("redis_server", "port") ->
    6379;
get("redis_server", "pass") ->
    undefined;
get("redis_server", "count") ->
    10;
get(_, _) ->
    undefined.


