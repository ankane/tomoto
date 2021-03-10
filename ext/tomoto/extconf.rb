require "mkmf-rice"

abort "Missing stdc++" unless have_library("stdc++")

$CXXFLAGS += " -std=c++17 -DEIGEN_MPL2_ONLY"

$CXXFLAGS += " -march=native"

apple_clang = RbConfig::CONFIG["CC_VERSION_MESSAGE"] =~ /apple clang/i

if apple_clang
  # silence rice warnings
  $CXXFLAGS += " -Wno-deprecated-declarations"
else
  # silence eigen warnings
  $CXXFLAGS += " -Wno-ignored-attributes -Wno-deprecated-copy"
end

# silence tomoto warnings
$CXXFLAGS += " -Wno-unused-variable -Wno-switch"

ext = File.expand_path(".", __dir__)
tomoto = File.expand_path("../../vendor/tomotopy/src/TopicModel", __dir__)
eigen = File.expand_path("../../vendor/eigen", __dir__)
eigen_rand = File.expand_path("../../vendor/EigenRand", __dir__)
variant = File.expand_path("../../vendor/variant/include", __dir__)

$srcs = Dir["{#{ext}}/*.cpp", "#{tomoto}/{LDAModel.cpp,SLDAModel.cpp}"]
$INCFLAGS += " -I#{tomoto} -I#{eigen} -I#{eigen_rand} -I#{variant}"
$VPATH << tomoto

create_makefile("tomoto/ext")
