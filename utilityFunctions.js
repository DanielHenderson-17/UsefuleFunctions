function reverseString(str) {
  return str.split('').reverse().join('');
}


function toTitleCase(str) {
  return str.toLowerCase().replace(/\b\w/g, char => char.toUpperCase());
}


function debounce(fn, delay) {
  let timeout;
  return (...args) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => fn.apply(this, args), delay);
  };
}

function sum(a, b) {
  return a + b;
}

function findMax(arr) {
  return Math.max(...arr);
}

function formatCurrency(amount) {
  return '$' + amount.toFixed(2);
}

function countVowels(str) {
  return (str.match(/[aeiou]/gi) || []).length;
}
