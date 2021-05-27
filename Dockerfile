FROM irssi

USER root
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential

# Install dependencies and troubleshooting tools
RUN apt-get install -y \
  libssl-dev \
  libxml2-dev \
  curl \
  less \
  vim-tiny \
  procps \
  net-tools

# Install Perl libraries
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Archive::Zip HTML::Entities XML::LibXML Digest::SHA JSON JSON::XS

USER user

ADD install.sh /home/user/install.sh
ADD autodl-irssi-community /home/user/autodl-irssi-community/
ADD autodl-trackers /home/user/autodl-irssi-community/AutodlIrssi/

VOLUME /home/user/watch

CMD ["/home/user/install.sh"]