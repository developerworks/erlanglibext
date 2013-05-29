%% Copyright
%% 生成构建Dialyzer PLT查询表
-module(generate_dialyzer_build_comand).
-author("Administrator").

%% API
-export([generate/0]).

generate() ->
    Mods = [
        stdlib,
        sasl,
        erts,
        mnesia,
        inets,
        ssh,
        ssl,
        crypto,
        eunit,
        asn1,
        public_key,
        et,
        hipe,
        edoc,
        odbc
    ],
    %% Paths = [filename:nativename(filename:join([code:lib_dir(Mod), "ebin"])) || Mod <- Mods],
    lists:foreach(
        fun(Mod) ->
            Path = filename:nativename(filename:join([code:lib_dir(Mod), "ebin"])),
            %%io:format("Adding module ~p to Persistent Lookup Table (PLT)~n", [Mod]),
            CmdStr = "dialyzer --add_to_plt -c ~p~n",
            io:format(CmdStr, [Path])
            %%os:cmd(CmdStr),
            %%io:format("Module ~p Added~n", [Mod])
        end, Mods
    ).


