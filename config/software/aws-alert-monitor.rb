name "aws-alert-monitor"
version ENV['version']

dependencies ["libxslt", "libxml2", "rubygems", "ruby", "virtualenv"]

env = { "GEM_HOME" => nil, "GEM_PATH" => nil }

build do
  gem "install aws-alert-monitor -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}", :env => env
end
