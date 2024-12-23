# KMP & Z function

## KMP Algorithm

The `kmp` function implements the Knuth-Morris-Pratt (KMP) string matching algorithm. It returns an array containing all start indices where the pattern string `t` appears in the text string `s`.

### Usage

To use the KMP algorithm, call the `kmp` function with the text string `s` and the pattern string `t` as parameters. The function will return an array of integers representing the start positions where `t` appears in `s`.

#### Parameters

- `s`: The text string.
- `t`: The pattern string.

#### Returns

- `Array[Int]`: An array of integers representing the start positions where `t` appears in `s`.

### Example

```moonbit
test "kmp" {
  let s = "ABABABC"
  let t = "ABA"
  inspect!(@kmp.kmp(s, t), content="[1, 3]")
}
```

In the example above, the `kmp` function is called with the text string `"ABABABC"` and the pattern string `"ABA"`. The function returns `[1, 3]`, indicating that the pattern appears at indices 1 and 3 in the text.

## Z Function

The `z_func` function computes the Z-function of a string. The Z-function for a string `s` of length `n` is an array of length `n` where the `i`-th element is the length of the longest substring starting from `s[i]` which is also a prefix of `s`.

### Usage

To use the Z-function, call the `z_func` function with the text string `s` and an optional pattern string `t`. If `t` is provided, the function returns the Z-function of `t` with respect to `s`.

#### Parameters

- `s`: The text string.
- `t~`: The optional pattern string.

#### Returns

- `Array[Int]`: The Z-function of `s` or `t` with respect to `s`.

### Example

```moonbit
test "z_func" {
  let a = "aaaabaa"
  let b = "aaaaa"
  inspect!(@kmp.z_func(b), content="[5, 4, 3, 2, 1]")
  inspect!(@kmp.z_func(b, t = a), content="[4, 3, 2, 1, 0, 2, 1]")
}
```

In the example above, the `z_func` function is called with the text string `"aaaaa"` and the optional pattern string `"aaaabaa"`. The function returns the Z-function of the pattern with respect to the text.