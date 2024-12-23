# Algorithm Library

This library provides implementations of various algorithms and data structures. The library is organized into several modules, each containing related functions and structures.

## Modules

### LCA (Lowest Common Ancestor)

#### Functions

- `create_Lca(data : Array[(Int, Int)], root~ : Int = 1) -> LCA`
  - Creates an LCA instance from the given edges and root.
- `lca(self : LCA, u : Int, v : Int) -> Int`
  - Finds the lowest common ancestor of two nodes.

#### Usage

```moonbit
test {
  let data = [(1, 2), (1, 3), (2, 4), (2, 5)]
  let lca = create_Lca(data, root = 1)
  inspect!(lca.lca(4, 5), content="2")
  inspect!(lca.lca(4, 3), content="1")
}
```

### Manacher's Algorithm

#### Functions

- `manacher(str: String) -> Int`
  - Finds the length of the longest palindromic substring in the given string.

#### Usage

```moonbit
test "manacher" {
  let s = "babad"
  inspect!(manacher(s), content="3") // "bab" or "aba"
  
  let s2 = "cbbd"
  inspect!(manacher(s2), content="2") // "bb"
}
```

### KMP (Knuth-Morris-Pratt) Algorithm

#### Functions

- `kmp(s : String, t : String) -> Array[Int]`
  - Finds all start positions where the pattern `t` appears in the text `s`.
- `z_func(s : String, t~ : String = "") -> Array[Int]`
  - Computes the Z-function of the string `s` or the pattern `t` in `s`.

#### Usage

```moonbit
test "kmp" {
  let s = "ABABABC"
  let t = "ABA"
  inspect!(@kmp.kmp(s, t), content="[1, 3]")
}

test "z_func" {
  let a = "aaaabaa"
  let b = "aaaaa"
  inspect!(@kmp.z_func(b), content="[5, 4, 3, 2, 1]")
  inspect!(@kmp.z_func(b, t = a), content="[4, 3, 2, 1, 0, 2, 1]")
}
```

### Prefix Sum

#### Functions

- `make_prefix1d(data : Array[Int]) -> Prefix1d`
  - Creates a 1D prefix sum array.
- `sum(self : Prefix1d, left : Int, right : Int) -> Int`
  - Computes the sum of the interval `[left, right]` in the 1D prefix sum array.
- `make_prefix2d(data : Array[Array[Int]]) -> Prefix2d`
  - Creates a 2D prefix sum array.
- `sum(self : Prefix2d, x1 : Int, y1 : Int, x2 : Int, y2 : Int) -> Int`
  - Computes the sum of the rectangle defined by `(x1, y1)` and `(x2, y2)` in the 2D prefix sum array.

#### Usage

```moonbit
test {
  let a1 = [1, 2, 3, 4, 5, 6 , 1, 2]
  let pre1 = @prefixSum.make_prefix1d(a1)
  inspect!(pre1.sum(2,4), content="9")
}

test {
  let a2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
  let pre2 = @prefixSum.make_prefix2d(a2)
  inspect!(pre2.sum(2,2,3,3), content="34")
}
```

### Sparse Table

#### Functions

- `st(data : Array[Int]) -> ST`
  - Builds a Sparse Table from the given array.
- `max_elem(self : ST, left : Int, right : Int) -> Int`
  - Finds the maximum element in the range `[left, right]` using the Sparse Table.

#### Usage

```moonbit
test {
  let arr = [1,2,3,4,5,6,1,2]
  let st = @st.st(arr)
  inspect!(st.max_elem(1, 1), content="1")
  inspect!(st.max_elem(2, 8), content="6")
}
```

### Binary Indexed Tree

#### Functions

- `bitTree(data : Array[Int]) -> Tree[Int]`
  - Builds a Binary Indexed Tree from the given array.
- `update(self : Tree[Int], left : Int, right : Int, val : Int) -> Unit`
  - Updates the range `[left, right]` by adding `val`.
- `query(self : Tree[Int], x : Int) -> Int`
  - Queries the prefix sum up to index `x`.

#### Usage

```moonbit
test {
  let arr = [1,2,3,4,5]
  let tmp = @binaryIndexedTree.bitTree(arr)
  inspect!(tmp.query(2), content="2")
  tmp.update(1,5,2)
  inspect!(tmp.query(4), content="6")
}
```

### Inverse Pair

#### Functions

- `inverse_pair[T : Compare](arr : Array[T]) -> Int`
  - Finds the number of inverse pairs in the array.

#### Usage

```moonbit
test {
  let arr = [2, 4, 1, 3, 5]
  inspect!(inverse_pair(arr), content="3")
  let arr2 = [5, 4, 3, 2, 1]
  inspect!(inverse_pair(arr2), content="10")
}
```

### APSP (All-Pairs Shortest Path)

#### Functions

- `create_floyd(edge : Array[(Int, Int, Int)], node : Int) -> Floyd`
  - Creates a Floyd instance from the given edges and number of nodes.
- `query(self : Floyd, u : Int, v : Int) -> Int`
  - Queries the shortest path distance between two nodes.

#### Usage

```moonbit
test {
  let edge = [(1, 2, 3), (2, 3, 4), (1, 3, 10)]
  let floyd = create_floyd(edge, 3)
  inspect!(floyd.query(1, 3), content="7")
}
```


### Algorithm Utilities

#### Functions

- `max[T : Compare](a : T, b : T) -> T`
  - Finds the maximum of two values.
- `min[T : Compare](a : T, b : T) -> T`
  - Finds the minimum of two values.
- `max_element[T : Compare](data : Array[T]) -> T`
  - Finds the maximum element in an array.
- `min_element[T : Compare](data : Array[T]) -> T`
  - Finds the minimum element in an array.
- `lower_bound[T : Compare](data : Array[T], value : T) -> Int`
  - Finds the first index of an element in the array that is not less than the value.
- `upper_bound[T : Compare](data : Array[T], value : T) -> Int`
  - Finds the first index of an element in the array that is greater than the value.
- `binary_search[T : Compare](data : Array[T], value : T) -> Bool`
  - Checks if a value exists in the array.
- `equal_range[T : Compare](data : Array[T], value : T) -> (Int, Int)`
  - Finds the range of elements in the array equal to the value.
- `merge[T : Compare](data1 : Array[T], data2 : Array[T]) -> Array[T]`
  - Merges two sorted arrays.
- `quick_pow(base : Int, power : Int, mod~ : Int = 1) -> Int64`
  - Computes the power of a number using fast exponentiation.
- `max_manhattan_distance(points : Array[Point]) -> Int`
  - Calculates the maximum Manhattan distance between all points.
- `inv(x : Int, mod : Int) -> Int`
  - Calculates the modular inverse of a number.

#### Usage

```moonbit
test "upper_bound" {
  let arr = [1,2,3,4,5]
  inspect!(@algorithm.upper_bound(arr, -1), content="0")
  inspect!(@algorithm.upper_bound(arr, 2), content="2")
  inspect!(@algorithm.upper_bound(arr, 7), content="5")
}


// 
test "binary_search" {
  let arr = [1,2,3,4,5]
  inspect!(@algorithm.binary_search(arr, 1), content="true")
  inspect!(@algorithm.binary_search(arr, 6), content="false")
  inspect!(@algorithm.binary_search(arr, 0), content="false")
}


test "equal_range" {
  let arr = [1,2,2,2,3,4,5]
  inspect!(@algorithm.equal_range(arr, 2), content="(1, 3)")
  inspect!(@algorithm.equal_range(arr, 7), content="(-1, -1)")
}


test "max_element" {
  let arr = [1,2,3,4,5]
  inspect!(@algorithm.max_element(arr), content="5")
  let arr = [1.1,2.4,3.9,4,5.9,1.0]
  inspect!(@algorithm.max_element(arr), content="5.9")
}


test "min_element" {
  let arr = [1,2,3,4,5]
  inspect!(@algorithm.min_element(arr), content="1")
  let arr = [1.1,2.4,3.9,4,5.9,1.2]
  inspect!(@algorithm.min_element(arr), content="1.1")
}


test "merge" {
  let arr1 = [1,2,5]
  let arr2 = [3,4,6]
  inspect!(@algorithm.merge(arr1, arr2), content="[1, 2, 3, 4, 5, 6]")
  let arr1 = [1,2,3]
  let arr2 = [4,5,6]
  inspect!(@algorithm.merge(arr1, arr2), content="[1, 2, 3, 4, 5, 6]")
}


test "quick_pow" {
  inspect!(@algorithm.quick_pow(2,10), content="1024")
}

test "max_manhattan_distance" { 
    let arr = [@algorithm.Point::{x:0,y:0}, @algorithm.Point::{x:1,y:0}, @algorithm.Point::{x:1,y:1}]
    inspect!(@algorithm.max_manhattan_distance(arr), content="2")
}

test "inv" { 
    inspect!(@algorithm.inv(2, 1000_000_007), content="500000004")
}
```