name "aws-alert-monitor"
version ENV['version']

dependencies ["rubygems"]

env = { "GEM_HOME" => nil, "GEM_PATH" => nil }

build do
  gem "install aws-alert-monitor -n #{install_dir}/bin --no-rdoc --no-ri -v #{version}", :env => env
end
