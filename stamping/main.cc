#include "linkstamp/stamp_lib.h"

#include <iostream>

int main(int argc, char** argv)
{
  std::cout << "build revision : " << get_build_revision() << " \n";
  std::cout << "build host     : " << get_build_host() << " \n";
  std::cout << "build status   : " << get_build_status() << " \n";
}
