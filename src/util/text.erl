

-module(text).

-compile(export_all).

bin(Data) when is_integer(Data) ->
    integer_to_binary(Data);
bin(Data) when is_list(Data) ->
    list_to_binary(Data);
bin(Data) when is_atom(Data) ->
    atom_to_binary(Data, latin1);
bin(Data) when is_float(Data) ->
    float_to_binary(Data);
bin(Data) when is_tuple(Data) ->
    bin(tuple_to_list(Data));
bin(Data) when is_binary(Data) ->
    Data.
