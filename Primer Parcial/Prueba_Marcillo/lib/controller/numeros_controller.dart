class NumberController {
  int menores15(List<int> nums) {
    int count = 0;
    for (var n in nums) {
      if (n < 15) count++;
    }
    return count;
  }

  int mayores50(List<int> nums) {
    int count = 0;
    for (var n in nums) {
      if (n > 50) count++;
    }
    return count;
  }

  int entre25_45(List<int> nums) {
    int count = 0;
    for (var n in nums) {
      if (n >= 25 && n <= 45) count++;
    }
    return count;
  }

  double promedio(List<int> nums) {
    if (nums.isEmpty) return 0;
    int suma = 0;
    for (var n in nums) {
      suma += n;
    }
    return suma / nums.length;
  }
}
