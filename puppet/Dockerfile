FROM centos:6.7

ENV PUPPET_VERSION 3.8.4

# Install general packages and enable the EPEL repo
RUN yum install -y unzip tar && \
    yum clean all

# Install Puppet
RUN rpm --import https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs && \
    rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm

RUN yum install -y puppet-$PUPPET_VERSION puppet-server-$PUPPET_VERSION && \
    yum clean all

# Install R10K
RUN puppet module install zack/r10k --modulepath /tmp/puppet/modules
COPY install-r10k.pp /tmp/puppet/manifests/install-r10k.pp
RUN puppet config set environmentpath /etc/puppet/environments && \
    puppet config set hiera_config /etc/puppet/hiera/hiera_production/hiera.yaml && \
    puppet apply /tmp/puppet/manifests/install-r10k.pp --modulepath /tmp/puppet/modules

# Install some Puppet tooling
RUN gem install --no-ri --no-rdoc puppet-lint

# For Puppet Master run:
# /usr/bin/puppet master --no-daemonize --verbose

# For Puppet Agent run:
# /usr/bin/puppet agent --test
