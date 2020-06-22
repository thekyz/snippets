#include <iostream>

void runlib() {
  std::cout << "lib features:\n";
#if defined(feature1)
  std::cout << "  + feature 1\n";
#endif
#if defined(feature2)
  std::cout << "  + feature 2\n";
#endif
#if defined(feature3)
  std::cout << "  + feature 3\n";
#endif
}


