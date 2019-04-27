class IdbCompanion < Formula
  desc "A Powerful Command Line for automating iOS Simulators"
  homepage "https://github.com/facebook/idb/README.md"
  url "https://github.com/facebook/idb/archive/v1.0.2.tar.gz"
  sha256 "8438e0d15cbef03879ec639c969297df8badb8b87d153b95e5487f22e221c637"
  head "https://github.com/facebook/idb.git"

  bottle do
    root_url "https://github.com/facebook/idb/releases/download/v1.0.2"
    cellar :any
    sha256 "942a767be4b3227999660c3202a570eae801aba586eeba704262b16abbc17bb8" => :mojave
  end

  depends_on :xcode => ["8.2", :build]
  depends_on "grpc" => "1.20.0"

  def install
    system "./idb_build.sh", "idb_companion", "build", prefix
  end

end
