# Run a Ruby docker container service
#
# docker run --rm -it --name ruby-dev 181gaming/ruby
#
# Information:
#   ruby:2.5.3
#   RVM
#   Bundler
#
FROM fedora:29
MAINTAINER Nicholas Houle <nmhoule@181gaming@gmail.com>

ENV NAME=ruby-dev \
    PATH=$PATH:$HOME/.rvm/bin \
    APP_PATH=/usr/src/app \
    RUBY_VERSION='2.5.3' \
    RUBY_GEMS='bundler'

RUN DNF_GROUPS='development-tools' \
    DNF_PACKAGES='bash procps curl wget ca-certificates net-tools \
                  vim tmux git tar bzip2' \
    && set -x \
    && dnf update -y && dnf install -y --setopt=tsflags=nodocs $DNF_PACKAGES \
    && dnf groupinstall -y "$DNF_GROUPS" \
    && curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - \
    && curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles \
    && dnf autoremove -y && dnf clean all \
    && rm -fr /tmp/* /var/tmp/* /var/lib/dnf/* \
    && echo "echo 'source /etc/profile.d/rvm.sh' >> ~/.bashrc"

# Install ruby using rvm
RUN /bin/bash -l -c "rvm requirements \
                     && rvm autolibs enable \
                     && rvm install $RUBY_VERSION \
                     && rvm --default use $RUBY_VERSION \
                     && rvm rvmrc warning ignore allGemfiles"

# Configure Ruby gems
RUN /bin/bash -l -c "gem update && gem install $RUBY_GEMS"

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Copy Gemfile and scripts
ENV BUNDLE_APP_CONFIG /home/docker/app/.bundle
WORKDIR /home/docker/app
COPY Gemfile lintit.rb ./

# Add docker user to container
ENV HOME /home/docker
RUN useradd --create-home --home-dir $HOME docker \
    && chown -R docker:docker $HOME

USER docker
#RUN /bin/bash -l -c 'bundle env'
RUN /bin/bash -l -c 'bundle install'

CMD ["/bin/bash"]
