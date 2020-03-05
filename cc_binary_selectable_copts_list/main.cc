#include <iostream>

void runlib(); // Defined in lib.cc
void runsublib(); // Defined in sublib.cc

int main(int argc, char** argv) {
  std::cout << "Running my app!\n";
  runlib();
  runsublib();
}
