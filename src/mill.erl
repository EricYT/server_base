
-module(mill).

-export([start/0]).

start() ->
    io:format("-----------> start mill app ~n"),
    
    application:start(sasl),
    application:start(crypto),

    application:start(sync),

    application:start(syntax_tools),
    application:start(compiler),
    application:start(goldrush),
    application:start(lager),

    application:start(ranch),
    application:start(cowlib),
    application:start(cowboy),

    application:start(reddy),

    application:start(millapp),
    
    ok.
