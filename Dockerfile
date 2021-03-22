FROM node:12-alpine

# Install OpenSSH and set the password for root to "Docker!". In this example, "apk add" is the install instruction for an Alpine Linux-based image.
RUN apk add openssh \
     && echo "root:Docker!" | chpasswd 

# Copy the sshd_config file to the /etc/ssh/ directory
COPY sshd_config /etc/ssh/


# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json /usr/src/app/
COPY yarn.lock /usr/src/app/
RUN npm install
RUN yarn install
COPY . /usr/src/app
RUN yarn build

# Set ENV vars
ENV NODE_ENV production
ENV PORT 1337
ENV HOST 0.0.0.0
EXPOSE 1337 5432 2222 80
ENTRYPOINT [ "yarn", "start" ]