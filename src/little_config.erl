

%% little config file
%%
%%
-module(little_config).

-export([get/2]).


-spec get(Key1, Key2) -> Value when
    Key1 :: string(),
    Key2 :: string(),
    Value :: any().
%% Http config
get("http", "host") ->
    "127.0.0.1";
get("http", "port") ->
    9527;
get("http", "count") ->
    10;

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


