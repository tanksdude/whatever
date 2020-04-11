# Small Fibonacci

A small recursive fibonacci number function. Small due to `bool`s being cast to a number when adding.

## Why?

I was dealing with some recursive functions and tried to wonder how I could shorten this:

```
int fib(int n) {
	if (n == 0) {
		return 0;
	}
	if (n == 1) {
		return 1;
	}
	return fib(n-1) + fib(n-2);
}
```

into this:

```
int fib(int n) {
	if (%CONDITIONAL%) {
		return %SOMETHING%;
	}
	return fib(n-1) + fib(n-2);
}
```

## "is that all?"

yep. what more do you expect from "small-fib"?

I kinda like to [code golf](https://en.wikipedia.org/wiki/Code_golf), okay?

## Building (Linux)

Using the Makefile:

```
cd <this project>
make
```

Then `./fib.out`.

# License

License: WTFPL 2

No idiots clause: This project has no warranty, superseding WTFPL 2.

# Acknowledgments

* StackOverflow
