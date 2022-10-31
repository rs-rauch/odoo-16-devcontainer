# Project 

Configuration file: [config/odoo.conf](config/odoo.conf)

```
project
└───addons              /// Place for your custom addons
│   │   README.md
└───enterprise          /// Place for enterprise addons
│   │   README.md
└───config
│   │   odoo.conf       /// Config for odoo
│   .env                /// Enviromnet variables (for Odoo, Postgress, etc.)
│   .gitignore
│   docker-compose.yml
│   project-start.sh
│   README.md
```


# Run

```bash
bash project-start.sh
```

# Use

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
