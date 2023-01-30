I feel as if I have detected some unexpected memory reservation
while executing Pro*C program with InstantClient-18.4 on AIX

These are the results of the 'curtest_01' test-program.

Client Os  Oracle Client Oracle Server Unexpected Memory Reservation
---------  ------------- ------------- -----------------------------
AIX 6.1    10.2.0.5.0    19.0.0.0.0         0
AIX 6.1    11.2.0.4.0    10.2.0.5.0         0
AIX 6.1    12.1.0.2.0    10.2.0.5.0         0
AIX 6.1    12.1.0.2.0    19.0.0.0.0         0
AIX 6.1    18.4.0.0.0    10.2.0.5.0      8416
AIX 6.1    18.4.0.0.0    19.0.0.0.0      8416
Linux      12.2.0.1.0    10.2.0.5.0         0
