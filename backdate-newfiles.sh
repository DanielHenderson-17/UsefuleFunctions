#!/bin/bash

declare -A dates_messages=(
  ["func01.js"]="2025-02-01|Add basic sum function"
  ["func02.js"]="2025-02-06|Add array max value extractor"
  ["func03.js"]="2025-02-07|Add currency formatter"
  ["func04.js"]="2025-02-08|Add vowel counter"
  ["func05.js"]="2025-02-15|Add palindrome checker"
  ["func06.js"]="2025-02-17|Add slug generator"
  ["func07.js"]="2025-02-20|Add array merger with deduplication"
  ["func08.js"]="2025-02-21|Add string truncator"
  ["func09.js"]="2025-03-02|Add name initials extractor"
  ["func10.js"]="2025-03-04|Add async delay function"
  ["func11.js"]="2025-03-06|Add clamp utility"
  ["func12.js"]="2025-03-08|Add numeric checker"
  ["func13.js"]="2025-03-31|Add deep array flattener"
  ["func14.js"]="2025-04-14|Add HTML escape function"
  ["func15.js"]="2025-06-09|Add object array sorter by key"
)

declare -A file_contents

file_contents["func01.js"]='function sum(a, b) {
  return a + b;
}'

file_contents["func02.js"]='function findMax(arr) {
  return Math.max(...arr);
}'

file_contents["func03.js"]='function formatCurrency(amount) {
  return "$" + amount.toFixed(2);
}'

file_contents["func04.js"]='function countVowels(str) {
  return (str.match(/[aeiou]/gi) || []).length;
}'

file_contents["func05.js"]='function isPalindrome(str) {
  const cleaned = str.replace(/[^a-z0-9]/gi, "").toLowerCase();
  return cleaned === cleaned.split("").reverse().join("");
}'

file_contents["func06.js"]='function generateSlug(str) {
  return str.toLowerCase().replace(/ /g, "-").replace(/[^\w-]+/g, "");
}'

file_contents["func07.js"]='function mergeArrays(a, b) {
  return [...new Set([...a, ...b])];
}'

file_contents["func08.js"]='function truncate(str, length) {
  return str.length > length ? str.substring(0, length) + "..." : str;
}'

file_contents["func09.js"]='function getInitials(name) {
  return name.split(" ").map(word => word[0].toUpperCase()).join("");
}'

file_contents["func10.js"]='function delay(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}'

file_contents["func11.js"]='function clamp(num, min, max) {
  return Math.min(Math.max(num, min), max);
}'

file_contents["func12.js"]='function isNumeric(val) {
  return !isNaN(parseFloat(val)) && isFinite(val);
}'

file_contents["func13.js"]='function flattenDeep(arr) {
  return arr.flat(Infinity);
}'

file_contents["func14.js"]='function escapeHtml(str) {
  return str.replace(/[&<>"'\''"]/g, function(match) {
    return {
      "&": "&amp;",
      "<": "&lt;",
      ">": "&gt;",
      "\"": "&quot;",
      "\x27": "&#039;"
    }[match];
  });
}'


file_contents["func15.js"]='function sortByKey(arr, key) {
  return arr.slice().sort((a, b) => (a[key] > b[key] ? 1 : -1));
}'


# Create files and commit
for file in "${!dates_messages[@]}"; do
  IFS='|' read -r date message <<< "${dates_messages[$file]}"
  echo "${file_contents[$file]}" > "$file"
  git add "$file"
  GIT_AUTHOR_DATE="${date}T12:00:00" GIT_COMMITTER_DATE="${date}T12:00:00" \
    git commit -m "$message"
done
