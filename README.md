# Spider-Scents v2

Spider-Scents v2 is a extented version of [Spider-Scents](https://github.com/Spider-Scents/dbfuzz).

In this version, we enhanced the database table traversal strategy and implemented customized payload generation specifically designed for JSON-structured data.



Spider-Scents v2 shares the same prerequisites and environment
setup as the original Spider-Scents scanner, which are detailed in the projects repos-
itory at https://github.com/Spider-Scents/dbfuzz. The scanning process is
initiated using the following command:
pipenv run script --config 'webapp_config.ini' --insert-empty
--reset-fuzzing --reset-scanning --sensitive-rows --primary-keys
--traversal column --traversal-order dfs
↪→
↪→
This introduces a new –traversal-order option, allowing users to select between
BFS and DFS traversal orders.
