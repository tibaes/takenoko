# Takenoko

A Pandas like DataFrame in Swift using TensorFlow as much as possible. A lot of ideas were borrowed from Matrix.swift
Or not. Tensors are hard to deal with. Lets begin with plain old arrays, okay?

## Motivations

- Data Scientists receive all the fun, Machine Learning Engineers do not.
- Simple by design, so you can hack the way you want.
- No index. Index is just a way to mess up your ETL.

## Recomendations

### Compiler flags

```
-Xswiftc -Ounchecked -Xcc -ffast-math -Xcc -O2
```

