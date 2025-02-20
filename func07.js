function mergeArrays(a, b) {
  return [...new Set([...a, ...b])];
}
