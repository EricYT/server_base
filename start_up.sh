#!/bin/bash

erl -pa ebin -pa deps/*/ebin -name eric@127.0.0.1 -setcookie eric -s mill
