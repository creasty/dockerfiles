# tlaplus

- https://github.com/tlaplus/tlaplus
- https://github.com/tlaplus/tlapm

## Example

```sh-session
$ ./tlaplus
tlaplus <command>

COMMANDS:
    tlc [args] <file>
    pcal [args] <module>
    sany <file>
    repl
    tex <file>
    pdf <file>
    pm <file>
```

```sh-session
$ ./tlaplus tlc ./example/Prisoners.tla
TLC2 Version 2.17 of 02 February 2022 (rev: 3c7caa5)
Running breadth-first search Model-Checking with fp 62 and seed 6458083274126986179 with 1 worker on 8 cores with 443MB heap and 64MB offheap memory [pid: 1] (Linux 5.10.47-linuxkit amd64, Debian 11.0.14 x86_64, MSBDiskFPSet, DiskStateQueue).
Parsing file /workdir/example/Prisoners.tla
Parsing file /tmp/Naturals.tla
Parsing file /tmp/FiniteSets.tla
Parsing file /tmp/Sequences.tla
Semantic processing of module Naturals
Semantic processing of module Sequences
Semantic processing of module FiniteSets
Semantic processing of module Prisoners
Starting... (2022-04-06 16:35:26)
Implied-temporal checking--satisfiability problem has 1 branches.
Computing initial states...
Computed 2 initial states...
Finished computing initial states: 4 distinct states generated at 2022-04-06 16:35:26.
Progress(14) at 2022-04-06 16:35:26: 860 states generated, 214 distinct states found, 0 states left on queue.
Checking temporal properties for the complete state space with 214 total distinct states at (2022-04-06 16:35:26)
Finished checking temporal properties in 00s at 2022-04-06 16:35:26
Model checking completed. No error has been found.
  Estimates of the probability that TLC did not check all reachable states
  because two distinct states had the same fingerprint:
  calculated (optimistic):  val = 7.5E-15
860 states generated, 214 distinct states found, 0 states left on queue.
The depth of the complete state graph search is 14.
The average outdegree of the complete state graph is 1 (minimum is 0, the maximum 3 and the 95th percentile is 2).
Finished in 00s at (2022-04-06 16:35:26)
```

```sh-session
$ ./tlaplus pm ./example/Prisoners.tla
(* created new "Prisoners.tlaps/Prisoners.thy" *)
(* fingerprints written in "Prisoners.tlaps/fingerprints" *)
```

```sh-session
$ ./tlaplus pdf ./example/Prisoners.tla
tla2tex.TLA Version 1.0 created  12 Apr 2013
looking for file: ./metadir/Prisoners
looking for file: ./metadir/Prisoners.log
looking for file: ./metadir/Prisoners
TLATeX pdf output written on Prisoners.pdf, from ./metadir.
TLATeX Postscript (or pdf) output written on Prisoners.ps (or Prisoners.pdf).
looking for file: ./metadir/Prisoners.pdf
Total execution time: 1.89 seconds
```
