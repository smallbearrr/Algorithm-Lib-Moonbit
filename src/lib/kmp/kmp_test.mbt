test "kmp" {
  let s = "ABABABC"
  let t = "ABA"
  inspect!(@kmp.kmp(s, t), content="[1, 3]")
}