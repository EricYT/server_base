-module(little_auth_handler).
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
    Peer = cowboy_req:peer(Req),
    HasBody = cowboy_req:has_body(Req),
    {ok, [{PostVals, _Flag}], Req2} = cowboy_req:body_qs(Req),
    AccoutAndPassword = mochijson2:decode(PostVals),
    lager:info("------> PostVals:~p Req2:~p", [PostVals, Req2]),
    lager:info("------> AccoutAndPassword:~p ", [AccoutAndPassword]),
    lager:info("------> lager opts:~p", [Opts]),
    lager:info("------> lager info:~p", [Req]),
    lager:debug("------> Peer info:~p", [Peer]),
    lager:debug("------> has body:~p", [HasBody]),
    lager:debug("------> auth debug"),
	{?MODULE, Req, #state{}}.

upgrade(Req, Env, Handler, State, _Timeout, _Run) ->
    io:format("--------> upgrade:~n "),
    Req0 = cowboy_req:set_resp_header(<<"name">>, "eric", Req),
    Req1 = cowboy_req:set_resp_body(<<"<html><title>hello Mr.jack</title><body> hi, joe!\r\n</body></html>">>, Req0),
    Req2 = cowboy_req:reply(200, Req1),
    {ok, Req2, Env}.

handle(Req, State=#state{}) ->
	{ok, Req2} = cowboy_req:reply(200, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
