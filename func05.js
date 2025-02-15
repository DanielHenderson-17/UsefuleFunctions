function isPalindrome(str) {
  const cleaned = str.replace(/[^a-z0-9]/gi, "").toLowerCase();
  return cleaned === cleaned.split("").reverse().join("");
}
