function launchWebapp(url) {
	window.open(url, 'webapp', 'toolbar=no, menubar=no, location=no, status=no');
	window.close();
}

const webappUrl = 'URL_PLACEHOLDER';
launchWebapp(webappUrl);
