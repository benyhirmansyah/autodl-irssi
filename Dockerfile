FROM irssi

USER root
RUN apt-get update
RUN apt-get install -y build-essential

# Install dependencies and troubleshooting tools
RUN apt-get install -y \
  libssl-dev \
  libxml2-dev \
  less \
  vim-tiny \
  procps \
  net-tools

# Install Perl libraries
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Archive::Zip Net::SSLeay HTML::Entities XML::LibXML Digest::SHA JSON JSON::XS

USER autodl

ADD install.sh /home/autodl/install.sh
ADD autodl-irssi-community /home/autodl/autodl-irssi-community/
ADD autodl-trackers /home/autodl/autodl-irssi-community/AutodlIrssi/

VOLUME /home/autodl/watch

CMD ["/home/autodl/install.sh"]