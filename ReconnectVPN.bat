@echo off
:loop
    echo Testing ping to gateway and find TTL...
    ping -n 10 10.7.1.1|FIND /I "TTL" > nul || (
       echo TTL dont't found, ping failure - disconnecting...
       rasdial IKEv2 /disconnect
          timeout /t 1 /nobreak
       echo reconnecting
          rasdial IKEv2
          timeout /t 1 /nobreak
   )
timeout /t 3 /nobreak
goto :loop