name            "aws-alert-monitor"

install_path    "/opt/intu/aws-alert-monitor"
build_version   ENV['version']
build_iteration ENV['iteration']

dependencies    ["preparation", "aws-alert-monitor"]

exclude         "\.git*"
