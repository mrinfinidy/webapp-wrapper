#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ $# -ne 2 ]; then
	echo "Usage: $0 <app-name> <url>"
	exit 1
fi

APP_NAME=$1
URL=$2

create_app() {
	mkdir $APP_NAME
	cp -r $SCRIPT_DIR/template/* $APP_NAME
	replace_launch_script
	replace_desktop
	replace_readme
}

replace_launch_script() {
        sed -i "s|URL_PLACEHOLDER|$URL|g" $APP_NAME/LAUNCH_SCRIPT_PLACEHOLDER
	mv $APP_NAME/LAUNCH_SCRIPT_PLACEHOLDER $APP_NAME/$APP_NAME.sh
	chmod +x $APP_NAME/$APP_NAME.sh
}

replace_desktop() {
	mv $APP_NAME/DESKTOP_PLACEHOLDER.desktop $APP_NAME/$APP_NAME.desktop
}

replace_readme() {
	sed -i "s|LAUNCH_SCRIPT_PLACEHOLDER|$APP_NAME|g" $APP_NAME/README.md
}

create_app
