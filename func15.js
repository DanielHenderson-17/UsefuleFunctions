function sortByKey(arr, key) {
  return arr.slice().sort((a, b) => (a[key] > b[key] ? 1 : -1));
}
