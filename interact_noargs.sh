#!/usr/bin/env expect

log_user 0
spawn ghci
log_user 1

expect ".*> "
send ":l running.hs\n"
expect ".*>"
send ":t solution\n"
expect ".*>"
send ":q\n"
interact
