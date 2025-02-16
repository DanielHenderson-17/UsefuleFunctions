function reverseString(str) {
  return str.split('').reverse().join('');
}


function toTitleCase(str) {
  return str.toLowerCase().replace(/\b\w/g, char => char.toUpperCase());
}
