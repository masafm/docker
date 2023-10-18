#!/bin/bash
export DISPLAY=:1.0
<<<<<<< HEAD
vncserver :1 -geometry 1280x1200 -localhost no >/dev/null
=======
vncserver :1 -geometry 1280x1200 -localhost no
>>>>>>> refs/remotes/origin/main
$*
