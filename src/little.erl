
-module(little).

-export([start/0]).

start() ->
    io:format("-----------> start little app ~n"),
    
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

    application:start(lhttpc),

    application:start(emysql),

    application:start(reddy),

    application:start(little),

    application:start(ecrontab),
    
    ok.
