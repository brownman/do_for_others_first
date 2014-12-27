#exec 2>/tmp/err
#exec 1>/tmp/out
echo 1>&2 '[ON RESTART] creating anchor for do_for_others_first...' #

file_self=$0

dir=$( cd `dirname $file_self`;pwd )
set +e
test -L /tmp/dir_root || ( ln -s $dir /tmp/dir_root )
ls -l /tmp/dir_root
/tmp/dir_root/SCRIPT/LIBRARY/install.sh
/tmp/dir_root/SCRIPT/GENERATOR/ANCHOR/ensure_anchors.sh
#cat /tmp/err
