#! /bin/sh

n=0; while :; do
      n="`expr $n + 1`"; 
      head -c 100 </dev/urandom >/tmp/test.$n.1; 
      ./tp1 </tmp/test.$n.1 >/tmp/test.$n.2 || break;
      ./tp1 </tmp/test.$n.2 >/tmp/test.$n.3 || break;
      diff -q /tmp/test.$n.1 /tmp/test.$n.3 || break;
      rm -f /tmp/test.$n.*;
      echo Ok: $n;
done; echo Error: $n
