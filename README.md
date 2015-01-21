## omnibus-aws-alert-monitor

**!!! This project has been deprecated. We recommend you fork it or look for an alternative solution. !!!**

This contains the skelton for building Omnibus AWS Alert Monitor packages.

## Build

To build the aws-alert-monitor RPM on the local system:

* The environment variables for version and iteration must be set,
  the version will correspond to gem version being pulled down
  and will result in the package version being created. Iteration only corresponds
  to the rpm version iteration.

        export version=0.1.0
        export iteration=1

		yum install -y --quiet intu-ruby git s3cmd rpm-build  python-setuptools
		gem install bundler -v 1.2.2 --no-ri --no-rdoc --quiet
		git clone --quiet https://github.com/intuit/omnibus-aws-alert-monitor.git /var/tmp/omnibus-aws-alert-monitor
		cd /var/tmp/omnibus-aws-alert-monitor
		bundle install --quiet --binstubs
		bin/omnibus build project aws-alert-monitor


## Continuous Integration

omnibus-aws-alert-monitor leverages knife-ec2 to create an instance which is used to build the RPM during CI. Over view of CI:

* Clone omnibus-aws-alert-monitor on CI instance and execute ci_setup.sh
* The ci_setup script uses knife-ec2 to create an ec2 instance
* The instance is bootstraped using the omnibus.rb bootstrap script.
* The git repo is cloned on the newly created build box.
* The necessary omnibus tools are installed.
* The RPM is built via omnibus.
* The RPM is uploaded to S3. Any RPMs with the same name, version and build iteration are replaced.
* The ci_setup script executes cleanup.rb to destroy any build boxes.

## Requirements

* AWS account with access to upload to S3 bucket and manage EC2 instances.
* Credentials set as AWS_SECRET_ACCESS_KEY and AWS_ACCESS_KEY_ID
* Ruby version 1.9.2 or higher
