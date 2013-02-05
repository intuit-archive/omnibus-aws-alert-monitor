## omnibus-aws-alert-monitor

This contains the skelton for building Omnibus AWS Alert Monitor packages.

## Build

To build the AWS Alert Monitor RPM on the local system:

    bundle exec rake projects:aws-alert-monitor

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
