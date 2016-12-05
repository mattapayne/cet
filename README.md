# Chrystal & Ember Todo List

## What is Crystal?

* https://crystal-lang.org/
* Have a syntax similar to Ruby (but compatibility with it is not a goal)
* Statically type-checked but without having to specify the type of variables or method arguments.
* Be able to call C code by writing bindings to it in Crystal.
* Have compile-time evaluation and generation of code, to avoid boilerplate code.
* Compile to efficient native code.

## Demo

Watch it work!

## Code Review

It's beautiful

## Pros

* Very Ruby-like syntax - would require only a small learning curve to use/adopt
* Strongly typed, but the compiler is super-smart and a lot of the time you don't specify the type
* Compiles to a single binary, like Golang
* Really solid base library
* Many "shards" available for common requirements
* Supports co-routines and channels, similar to Golang
* Fast as hell
* Sidekiq has been ported to Crystal!
* Support for macros, which allows a lot of similar metaprogramming functionality as Ruby
* Can directly call C libraries and OS libraries.
* Source code formatting tool, like Golang

## Cons

* Young language - unproven in widescale production use
* Currently only runs on a single core (but does support fibers)
* Limited number of 3rd part libraries available due to its youth
* No REPL, but does have Play - an in-browser playground
* No Windows support (not that we care)
* Metaprogramming is little more limited than Ruby (but not too much)

## Summary

Overall, I relly like Crystal and think that it has promise. It would be good for
building a fast API and has all of the features that we would need to support that use case.
I think that it's a bit too soon to use it in production, though, It needs a bit longer
to get a few missing pieces (like multi core support).
