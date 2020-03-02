# Silvercar Coding Challenge

## Table of Contents

<!-- MarkdownTOC levels="1,2,3,4" autolink=true bracket=round -->

- [Development Setup](#development-setup)
  - [I. System Dependencies](#i-system-dependencies)
    - [Using Docker Compose](#using-docker-compose)
      - [1. Prerequisites](#1-prerequisites)
      - [2. Setup your environment](#2-setup-your-environment)
      - [3. Running the app](#3-running-the-app)

<!-- /MarkdownTOC -->

# Development Setup

## I. System Dependencies

### Using Docker Compose

Provisioning from an already built machine takes approximately 3 - 4 minutes. Provisioning from scratch takes approximately 20 minutes.

#### 1. Prerequisites

Make sure you have installed Docker. Go here https://www.docker.com/community-edition#/download for installation instructions. And the Docker app is launched.

To install using brew follow these steps:

```
brew cask install docker
brew cask install docker-toolbox
```

**NOTE:** you may get a warning about trusting Oracle on the first try. Open System Preferences > Security & Privacy, click the Allow Oracle button, and then try again to install docker-toolbox

#### 2. Setup your environment

Run the setup script:

```
bin/setup
```

#### 3. Running the app

We've created a helper script to run and manage the app through docker that wraps around the `docker-compose` command.
You can still use `docker-compose` directly, but for the basic stuff you can use the following:

* Building the image: `bin/docker build` or `bin/docker b`
* Start the vm: `bin/docker start` or `bin/docker t`
* Stop the vm: `bin/docker stop` or `bin/docker p`
* Destroy the image: `bin/docker destroy` or `bin/docker d`
* Start the app: `bin/docker server` or `bin/docker s`
* Connect to the app container with bash: `bin/docker bash` or `bin/docker c`
* Run any command: `bin/docker run [COMMAND]` or `bin/docker r [COMMAND]`

**NOTE:**
To exit the server, user `ctrl + c` as you would in a normal rails server setup. You will see this output:

```
Stopping silvercar_app         ... done
Stopping silvercar_db          ... done
```

Sometimes you might not see that come out, which means it didn't gracefully shut down. If that happens run `bin/docker stop` to make sure all of the services are shut down properly.

**PS**: The app will be available at `http://localhost:3000` or `http://0.0.0.0:3000` (like any typical Rails app).

