# WebApp Wrapper

## USAGE
Create web app
- `create-app.sh <app-name> <url>`

Run web app
- `./<app-name>/<app-name>.sh`

## 'Barless' Firefox
1. Create profile for to use as webapp wrapper (barless).
Enter `about:profiles` in Firefox and give the new profile a name, e.g. `no-title-bar`
2. Enable userChrome for this profile.
Launch a browser instance of this browser and enable userChrome.
Enter 'about:config' and set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
3. Open the profile's root directory, create `chrome` directory and inside this directory create `userChrome.css`
4. Paste the following css into userChrome.css

```
/*
 * Do not remove the @namespace line -- it's required for correct functioning
 */
@namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul"); /* set default namespace to XUL */

/*
 * Hide tab bar, navigation bar and scrollbars
 * !important may be added to force override, but not necessary
 * #content is not necessary to hide scroll bars
 */
#TabsToolbar {visibility: collapse;}
#navigator-toolbox {visibility: collapse;}
browser {margin-right: -14px; margin-bottom: -14px;}
```
5. Now you can launch a barless instance by running `firefox-bin --new-window -P <profile name> <url>`
