require "mkmf-rice"

abort "Missing stdc++" unless have_library("stdc++")

$CXXFLAGS += " -std=c++11 -DEIGEN_MPL2_ONLY"

$CXXFLAGS += " -march=native"

apple_clang = RbConfig::CONFIG["CC_VERSION_MESSAGE"] =~ /apple clang/i

if apple_clang
  # silence rice warnings
  $CXXFLAGS += " -Wno-deprecated-declarations"
end

# silence tomoto warnings
$CXXFLAGS += " -Wno-unused-variable -Wno-switch"

ext = File.expand_path(".", __dir__)
tomoto = File.expand_path("../../vendor/tomotopy/src/TopicModel", __dir__)
eigen = File.expand_path("../../vendor/eigen", __dir__)
eigen_rand = File.expand_path("../../vendor/EigenRand", __dir__)

$srcs = Dir["{#{ext},#{tomoto}}/*.cpp"]
$INCFLAGS += " -I#{tomoto} -I#{eigen} -I#{eigen_rand}"
$VPATH << tomoto

create_makefile("tomoto/ext")