extern const char kBuildRevision[] __attribute__((weak));
extern const char kBuildHost[] __attribute__((weak));
extern const char kBuildStatus[] __attribute__((weak));

const char *get_build_revision() {
  if (&kBuildRevision == nullptr) return "unknown";
  return kBuildRevision;
}

const char *get_build_host() {
  if (&kBuildHost == nullptr) return "unknown";
  return kBuildHost;
}

const char *get_build_status() {
  if (&kBuildStatus == nullptr) return "unknown";
  return kBuildStatus;
}
