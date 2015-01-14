
-module(mysql_config).

-export([get/2]).


get("mysql", "host") -> "localhost";
get("mysql", "port") -> 3306;
get("mysql", "user") -> "little";
get("mysql", "password") -> "1234";
get("mysql", "database") -> "little_db";
get("mysql", "pool") -> 'master_pool';
get("mysql", "pool_size") -> 10;
get("mysql", "encoding") -> utf8.


