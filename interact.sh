#!/usr/bin/env expect

log_user 0
spawn ghci
log_user 1

expect ".*> "
send ":l running.hs\n"
expect ".*>"
send ":t solution_num nil\n"
expect ".*>"
send ":q\n"
interact
