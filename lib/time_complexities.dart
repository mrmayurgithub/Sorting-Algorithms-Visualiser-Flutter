bestTime(String value) {
  Map<String, String> complx = {
    'bubble': 'O(n)',
    'merge': 'O(nLog(n))',
    'selection': 'O(n^2)',
    'heap': 'O(nLog(n))',
    'quick': 'O(nLog(n))',
    'insertion': 'O(n)'
  };
  return complx[value];
}

averageTime(String value) {
  Map<String, String> complx = {
    'bubble': 'O(n^2)',
    'merge': 'O(nLog(n))',
    'selection': 'O(n^2)',
    'heap': 'O(nLog(n))',
    'quick': 'O(nLog(n))',
    'insertion': 'O(n^2)'
  };
  return complx[value];
}

worstTime(String value) {
  Map<String, String> complx = {
    'bubble': 'O(n^2)',
    'merge': 'O(nLog(n))',
    'selection': 'O(n^2)',
    'heap': 'O(nLog(n))',
    'quick': 'O(n^2)',
    'insertion': 'O(n^2)'
  };
  return complx[value];
}
