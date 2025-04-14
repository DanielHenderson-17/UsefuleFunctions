function escapeHtml(str) {
  return str.replace(/[&<>"'"]/g, function(match) {
    return {
      "&": "&amp;",
      "<": "&lt;",
      ">": "&gt;",
      "\"": "&quot;",
      "\x27": "&#039;"
    }[match];
  });
}
