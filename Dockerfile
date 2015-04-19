FROM ubuntu
RUN /usr/bin/apt-get update
RUN /usr/bin/apt-get install -y curl libpq-dev
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -c -l 'rvm requirements'
RUN /bin/bash -c -l 'rvm install 2.2.0'
RUN /bin/bash -c -l 'rvm use 2.2.0'
RUN /bin/bash -c -l 'gem install bundler --no-ri --no-doc'
RUN /bin/bash -c -l 'bundle config path "$HOME/bundler"'
ADD . kmplr
WORKDIR kmplr
RUN /bin/bash -c -l 'bundle install'
EXPOSE 80
CMD /bin/bash -c -l 'ruby bin/rails server -p 80'
