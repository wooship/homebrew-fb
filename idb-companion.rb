# Copyright (c) Facebook, Inc. and its affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.14.tar.gz"
  sha256 "dc1bf88d2b6461b361f10ae152cd382a226549d21b5cde392a424914a5d428bd"
  head "https://github.com/facebook/idb.git"

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.29.1"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.14"
    sha256 cellar: :any, big_sur: "50d8dfdda62d984d50f6f095674725861224b70470bf2bc65fdcdd540b1533bb"
  end

  def install
    system "./idb_build.sh", "idb_companion", "build", prefix
  end

  def post_install
    [
      prefix/'Frameworks/FBDeviceControl.framework/Versions/A/Resources/libShimulator.dylib',
      prefix/'Frameworks/FBSimulatorControl.framework/Versions/A/Resources/libShimulator.dylib',
      prefix/'Frameworks/XCTestBootstrap.framework/Versions/A/Resources/libShimulator.dylib',
    ].each do |shim|
      system "codesign", "--force", "--sign", "-", "--timestamp=none", shim
    end
  end

end

