struct Tree[Int] {
  data : Array[Int]
  tr : Array[Int]
}

// fn op_add(self : T, other : T) -> T {self + other}
fn lowbit(x : Int) -> Int {
  x & (-x)
}

fn update_in(self : Tree[Int], x : Int, val : Int) -> Unit {
  for i = x; i <= self.data.length(); i = i+1 {
    self.tr[i] += val
  }
}

/// Update
/// 
/// # Parameters
/// 
/// - `data` : The array need to build
/// 
/// # Returns
/// 
/// - `Tree[Int]` : Binary Indexed Tree
///
pub fn update(self : Tree[Int], left : Int, right : Int, val : Int) -> Unit{
  self.update_in(left, val)
  self.update_in(right+1, -val)
}

/// Build Binary Indexed Tree
/// 
/// # Parameters
/// 
/// - `data` : The array need to build
/// 
/// # Returns
/// 
/// - `Tree[Int]` : Binary Indexed Tree
///
pub fn query(self : Tree[Int], x : Int) -> Int {
  let mut res : Int = 0
  for i = x; i >= 1; i = i-lowbit(i) {
    res += self.tr[i]
  }  
  res
}

/// Build Binary Indexed Tree
/// 
/// # Parameters
/// 
/// - `data` : The array to build Binary Indexed Tree
/// 
/// # Returns
/// 
/// - `Tree[Int]` : Binary Indexed Tree
///
pub fn bitTree(data : Array[Int]) -> Tree[Int] {
  let sz = data.length()
  let tr = Array::make(sz+2, 0)
  
  let tree = Tree::{data, tr}
  tree.update_in(1, data[0])
  for i = 2; i <= sz; i = i+1 {
    tree.update_in(i, data[i-1] - data[i-2])
  }
  tree
}

