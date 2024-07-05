# Archived
we're no longer maintaining this repo.

# Project 

Configuration file: [config/odoo.conf](config/odoo.conf)

```
project
└───addons              /// Place for your custom addons
│   │   .addons
└───config
│   │   odoo.conf       /// Config for odoo
└───enterprise          /// Place for enterprise addons
│   │   .enterprise
│   .env                /// Enviromnet variables (for Odoo, Postgress, etc.)
│   .gitignore
│   docker-compose.yml
│   odoo-init.sh        /// Setup odoo script 
│   odoo.Dockerfile     /// Dockerfile for odoo service
│   project-start.sh
│   README.md
```


# Run

On Linux, WSL, or using bash, start the project with:

```bash
bash project-start.sh
```

Using docker-compose directly:

```bash
docker-compose -f docker-compose.yml up
```

Go to [localhost:8069/web/login](http://localhost:8069/web/login)

## Rebuild the image
After changing environent parameters, a build might be neccessary. ```--build``` will do that:

```bash
docker-compose -f docker-compose.yml up --build
```


# Default login

Email
```
admin
```

Password
```
admin
```

# Odoo database manager

To see all your databases or to create a new one go to [localhost:8069/web/database/manager](http://localhost:8069/web/database/manager).


# Development

Folder contains a Dev Container configuration file. 

Install [```ms-vscode-remote.remote-containers```](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension.

Reopen folder to develop in a container ([learn more](https://aka.ms/vscode-remote/docker)).

# Status
To get the current status of the containers including additional information run
```bash
docker ps
```

# Cleanup
To start with a fresh database (because you need it, or after changing the odoo version), get the volume name from:
```bash
docker volume ls
docker image ls
```
It usually ends with ```*-db``` or  ```*-db-1```. Make sure the project/container is stopped (see section 'Status').

To delete the volume run the following command. 
```bash
docker volume rm VOLUME 
```
Replace ```VOLUME``` with the volume name.
If the volume somehow is still in use, you can delete the database image ```docker image rm IMAGE``` add ```--force``` to the command.

# Tools

Get the [Odoo Debug Extension](https://github.com/droggol/OdooDebug) for [Chrome](https://chrome.google.com/webstore/detail/odoo-debug/hmdmhilocobgohohpdpolmibjklfgkbi) or [Firefox](https://addons.mozilla.org/en-US/firefox/addon/odoo-debug/).


# Odoo CLI

Connect to odoo container:

```bash
docker exec -it CONTAINER /bin/bash
```

# Windows Subsystem for Linux (WSL)
The development performance on Windows can be improved by using the Windows Subsystem for Linux (WSL). 
To activate it follow these steps, using the Windows PowerShell:

```PowerShell
wsl --install
```
"This command will enable the features necessary to run WSL and install the Ubuntu distribution of Linux."

Find the full step-by-step guide [here](https://learn.microsoft.com/de-de/windows/wsl/install), including how to switch distros.


If everything was successfull, Ubuntu will show up in you Docker Desktop settings.

# FAQ

## Error: ```$ /odoo-init.sh: 2: set: Illegal option - ```
The odoo-init.sh script will setup everything inside the odoo container. That container is based on a Linux which uses different escaping characters for linebreaks, than Windows.

- On Windows it is set to be ```CR LF```. Make sure the control characters are set to be ```LF```. In VS Code there is a button in the bottom right, next to the UTF-8 encoding.

```CR = Carriage Return and LF = Line Feed```

## Error: ```error during connect: this error may indicate that the docker daemon is not running```
- Your docker is not working correctly. Make sure it is running.
