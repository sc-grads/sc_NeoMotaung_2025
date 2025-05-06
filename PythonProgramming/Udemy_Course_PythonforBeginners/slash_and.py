def func(var_a: str, *, var_b: str) -> None:
    print(var_a)
    print(var_b)

#Variables before / must be passed in as a positional argument
#Arguments after * must be passed in as a key variable
func("a", var_b="b")