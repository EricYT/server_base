
-module(mysql).

-export([start/0, run/1]).

-spec start() -> ok.
start() ->
    Host        = mysql_config:get("mysql", "host"),
    Port        = mysql_config:get("mysql", "port"),
    User        = mysql_config:get("mysql", "user"),
    Password    = mysql_config:get("mysql", "password"),
    Database    = mysql_config:get("mysql", "database"),
    Pool        = mysql_config:get("mysql", "pool"),
    PoolSize    = mysql_config:get("mysql", "pool_size"),
    Encoding    = mysql_config:get("mysql", "encoding"),

    lager:debug("------> start mysql connects:Host:~p Database:~p Pool:~p Size:~p", [Host, Database, Pool, PoolSize]),
    emysql:add_pool(Pool, PoolSize, User, Password, Host, Port, Database, Encoding).


run(SQL) ->
    emysql:execute(mysql_config:get("mysql", "pool"), text:bin(SQL)).
