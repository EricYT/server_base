-module(little_ping_handler).
%%-behaviour(cowboy_http_handler).

-export([init/2]).
-export([handle/2]).
-export([terminate/3]).
-export([upgrade/6]).

-include("little.hrl").
-record(state, {
}).

init(Req, Opts) ->
    Method = cowboy_req:method(Req),
    lager:info("------> lager info"),
    lager:error("------> lager error"),
    %%io:format("--------> Opts : ~p  Req : ~p Method: ~p~n", [Opts, Req, Method]),
    lager:debug("------> lager debug"),
	{?MODULE, Req, #state{}}.

upgrade(Req, Env, Handler, State, _Timeout, _Run) ->
    %%io:format("--------> Req: ~p ~n", [Req]),
    {ok, Req, Env}.

handle(Req, State=#state{}) ->
	{ok, Req2} = cowboy_req:reply(200, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
