function getInitials(name) {
  return name.split(" ").map(word => word[0].toUpperCase()).join("");
}
