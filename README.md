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

```bash
bash project-start.sh
```

Go to [localhost:8069/web/login](http://localhost:8069/web/login)


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


# Tools

Get the [Odoo Debug Extension](https://github.com/droggol/OdooDebug) for [Chrome](https://chrome.google.com/webstore/detail/odoo-debug/hmdmhilocobgohohpdpolmibjklfgkbi) or [Firefox](https://addons.mozilla.org/en-US/firefox/addon/odoo-debug/).


# Odoo CLI

Connect to odoo container:

```bash
docker exec -it web /bin/bash
```

# FAQ

## Error: ```$ /odoo-init.sh: 2: set: Illegal option - ```
The odoo-init.sh script will setup everything inside the odoo container. That container is based on a Linux which uses different escaping characters for linebreaks, than Windows.

- Make sure the control characters are set to ```LF```. On Windows it is set to be ```CR LF```. In VS Code there is a button in the bottom right, next to the UTF-8 encoding.

```CR = Carriage Return and LF = Line Feed```