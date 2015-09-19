/*
TEST_OUTPUT:
---
fail_compilation/lambda.d(17): Error: `... => { ... }` declares a function returning another function; if this is really what you want, surround the right-hand side by parentheses: ... => ({ ... }), otherwise remove the `=>`
fail_compilation/lambda.d(21): Error: `... => { ... }` declares a function returning another function; if this is really what you want, surround the right-hand side by parentheses: ... => ({ ... }), otherwise remove the `=>`
---
*/

int foo(alias fun)() {
    return fun(0);
}

void main() {
    foo!(a => a);
    foo!(a => (a));
    foo!(a => ({ return a; }));
    foo!(a => { return a; });
    foo!((a) => a);
    foo!((a) => (a));
    foo!((a) => ({ return a; }));
    foo!((a) => { return a; });
}
