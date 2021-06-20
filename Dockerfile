FROM node

RUN npm install npm@latest -g

RUN npm install -g newman

# Create a project directory
RUN mkdir /reqrestest/

# Copy all the files from the current working directory to newly created project directory in the above step
ADD . /reqrestest/

# Set newly created project directory as working directory
WORKDIR /reqrestest/

ENTRYPOINT newman run collections/reqrestest.collection.json -d repo_testdata/data.csv
