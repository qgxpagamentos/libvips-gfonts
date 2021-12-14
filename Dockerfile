FROM qgxpagamentos/libvips

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update && \
  apt-get install --no-install-recommends -y unzip

RUN mkdir -p /root/.config/fontconfig
ADD fonts.conf /root/.config/fontconfig/fonts.conf

# Google fonts
RUN mkdir -p /usr/share/fonts/truetype/google-fonts
RUN wget -O /usr/share/fonts/truetype/google-fonts/nunito.zip  https://fonts.google.com/download?family=Nunito
RUN unzip -d /usr/share/fonts/truetype/google-fonts /usr/share/fonts/truetype/google-fonts/nunito.zip
RUN find /usr/share/fonts/truetype/google-fonts -name "*.ttf" -exec install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1
RUN rm -f /usr/share/fonts/truetype/google-fonts/nunito.zip
RUN fc-cache -f && rm -rf /var/cache/*

ENV TZ=America/Sao_Paulo

RUN echo $TZ > /etc/timezone
