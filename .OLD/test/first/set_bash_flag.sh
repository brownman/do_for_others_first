
#goal: disable command: set (so that trap is not canceled within subshells)
#strategy: overide command set by using: alias set='some other command'

set -e
