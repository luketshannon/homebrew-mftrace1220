# mftrace-mtdbt2f
two small changes to `mftrace@1.2.20` to keep it working with `mtdbt2f` in `python@3.9.12`:

## changes
1. change regex strings in mftrace.py to raw strings by prefixing `r`, silencing errors with escape characters.
2. gracefully handle parsing errors in tfm.py by adding `errors='ignore'` to ascii decoding step.


## install
```
brew tap luketshannon/mftracemtdbt2f
```
and then
```
brew install mftracemtdbt2f
```