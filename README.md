# RedMine Group Macro
## A RedMine plugin

This plugin adds a new macro to be used in text fields. It allow users to display text only seen by specified members of a group.
It might be usefull to create a welcome page adapted according to the connected user (one page for 'customers', one for 'developpers' ...)


## Features :

This plugin provides the following features :
* New macro group
* Shortcut button aboce welcome text field in settings

Languages availables :
* EN
* FR


## Use :

	{{group(MyGroup)
	My multiline Text.
	}}

## Installation :

	$cd /path/to/redmine/directory/plugins
	$git clone https://github.com/BlueXML/redmine_group_macro.git

## Compatibility :
Tested for RedMine 3.3.* (Manually)

## License :
This plugin is licensed under the GNU/GPL license v3.


