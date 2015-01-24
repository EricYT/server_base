#!/bin/bash

erl -pa $(pwd)/ebin -pa $(pwd)/deps/*/ebin -name eric@127.0.0.1 -setcookie eric -s little
#erl -pa ../server_base/ebin -pa ./deps/*/ebin -name eric@127.0.0.1 -setcookie eric -s little
