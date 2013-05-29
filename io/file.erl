%% Copyright
-module(file).
-author("Administrator").

-type posix() ::   eacces | eagain | ebadf
 | ebusy
 | edquot
 | eexist
 | efault
 | efbig
 | eintr
 | einval
 | eio
 | eisdir
 | eloop
 | emfile
 | emlink
 | enametoolong
 | enfile
 | enodev
 | enoent
 | enomem
 | enospc
 | enotblk
 | enotdir
 | enotsup
 | enxio
 | eperm
 | epipe
 | erofs
 | espipe
 | esrch
 | estale
 | exdev.
%% API
-export([read_terms/1, write_terms/2]).

%% @doc 从二进制文件中读取Terms,提高大文件读取速度

-spec read_terms(BinaryFile :: string()) -> term().
read_terms(BinaryFile) ->
    {ok, Binary} = file:read_file(BinaryFile),
    binary_to_term(Binary).

%% @doc read_terms对应的写文件函数

-spec write_terms(BinaryFile :: string(), Terms::term()) -> ok | {error, posix() | badarg | terminated | system_limit}.
write_terms(BinaryFile, Terms) ->
    file:write_file(BinaryFile, term_to_binary(Terms)).

