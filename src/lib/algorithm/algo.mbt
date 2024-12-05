///| Min Max

/// Maximum value
/// 
/// # Parameters
/// 
/// - `a` : value to compare
/// - `b`: value to compare
/// 
/// # Returns
/// 
/// - `T` : maximum value
pub fn max[T : Compare](a : T, b : T) -> T { if a > b {a} else {b} }

/// Minimum value
/// 
/// # Parameters
/// 
/// - `a` : value to compare
/// - `b`: value to compare
/// 
/// # Returns
/// 
/// - `T` : minimum value
pub fn min[T : Compare](a : T, b : T) -> T { if a < b {a} else {b} }


/// Maximum value in array
/// 
/// # Parameters
/// 
/// - `data` : Array[T]
/// 
/// # Returns
/// 
/// - `T` : maximum value in array
pub fn max_element[T : Compare](data : Array[T]) -> T {
  data.fold(init = data[0], fn(mx, x) {if x > mx {x} else {mx}})
}


/// Minimum value in array
/// 
/// # Parameters
/// 
/// - `data` : Array[T]
/// 
/// # Returns
/// 
/// - `T` : minimum value in array
pub fn min_element[T : Compare](data : Array[T]) -> T {
  data.fold(init = data[0], fn(mx, x) {if x < mx {x} else {mx}})
}


///| Binary Search

/// Find first index of element in array that not less than value
/// 
/// # Parameters
/// 
/// - `data` : The array need to be search
/// - `value`: The value need to compare
/// 
/// # Returns
/// 
/// - `Int` : first index in array that not less than value
/// 
pub fn lower_bound[T : Compare](data : Array[T], value : T) -> Int {
  let mut count = data.length()
  let mut first = 0

  while count > 0 {
    let step = count / 2
    let it = first + step
    if (data[it] < value) {
      first = it + 1
      count -= step + 1
    } else {
      count = step
    }
  }
  first
}


/// Find first index of element in array that bigger than value
/// 
/// # Parameters
/// 
/// - `data` : The array need to be search
/// - `value`: The value need to compare
/// 
/// # Returns
/// 
/// - `Int` : first index in array that bigger than value
/// 
pub fn upper_bound[T : Compare](data : Array[T], value : T) -> Int {
  let mut count = data.length()
  let mut first = 0

  while count > 0 {
    let step = count / 2
    let it = first + step
    if (data[it] <= value) {
      first = it + 1
      count -= step + 1
    } else {
      count = step
    }
  }
  first
}


/// Find whether a value in the array
/// 
/// # Parameters
/// 
/// - `data` : The array need to be search
/// - `value`: The value need to find
/// 
/// # Returns
/// 
/// - `Bool` : value in or not in array
/// 
pub fn binary_search[T : Compare](data : Array[T], value : T) -> Bool {
  let first = lower_bound(data, value)
  first != data.length() && data[first] == value
}


/// Find range of array equal to value
/// 
/// # Parameters
/// 
/// - `data` : The array need to be search
/// - `value`: The value need to find
/// 
/// # Returns
/// 
/// - `(Int, Int)` : Range of array equal to value
///
pub fn equal_range[T : Compare](data : Array[T], value : T) -> (Int, Int) {
  let l = lower_bound(data, value)
  let r = upper_bound(data, value)
  if l > r-1{ return (-1, -1) }
  (l, r-1)
}




///| Merge

/// Merge two sorted array in sequence
/// 
/// # Parameters
/// 
/// - `data1` : First array
/// - `data2`: Second array
/// 
/// # Returns
/// 
/// - `Array[T]` : Merged array of data1 and data2
///
pub fn merge[T : Compare](data1 : Array[T], data2 : Array[T]) -> Array[T] {
  let len1 = data1.length(); let len2 = data2.length()
  let mut res = []
  let mut i = 0 ;let mut j = 0
  for ; i < len1 ; {
    if j == len2 {
      return res.iter().concat(data1[i:].iter()).collect()
    } 
    if data1[i] < data2[j] {
      res += [data1[i]]
      i += 1
    } else {
      res += [data2[j]]
      j += 1
    }
  }
  res.iter().concat(data2[j:].iter()).collect()
}


///|sort

