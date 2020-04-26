FROM ruby:2.5.8

#add nodejs and yarn dependencies for the frontend
RUN url -sL https://deb.nodesource.com/setup_6.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#instala dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

#seta path
ENV INSTALL_PATH /onebitexchange

#cria repositorio
RUN mkdir -p $INSTALL_PATH

# Seta o path como o diretório principal
WORKDIR $INSTALL_PATH

# não é necessário pq o COPY copia tudo, incluindo o Gemfile
# Copia o Gemfile para dentro do container
# COPY Gemfile ./ 

# Seta o path para as Gems
ENV BUNDLE_PATH /gems

# Copia o código para dentro do container
COPY . .