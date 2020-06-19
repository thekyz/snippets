#include "linkstamp/stamp_lib.h"
#include "build_info.h"

#include <iostream>

int main(int argc, char** argv)
{
  std::cout << "custom build id v : " << BUILD_CUSTOM_ID_V << " \n";
  std::cout << "custom build id f : " << BUILD_CUSTOM_ID_F << " \n";
  std::cout << "build revision : " << get_build_revision() << " \n";
  std::cout << "build host     : " << get_build_host() << " \n";
  std::cout << "build status   : " << get_build_status() << " \n";
}
