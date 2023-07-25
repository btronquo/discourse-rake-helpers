# **Discourse Rake Helpers** Plugin

**Plugin Summary**

Just add some usefull rake commands

**How to ?**
- Add the plugin to your container/app.yml
- ./launcher rebuild app
- ./launcher enter app

Disable every user account (Except Admins / Staff)
> rake rakehelpers:deactivate

Send activation email for disabled user account

> rake rakehelpers:send_activation_email
