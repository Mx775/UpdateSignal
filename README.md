# UpdateSignal

My personal workflow to automate the process of updating the software I have hosted on OBS (openSUSE's Open Build Servive), by automatically checking for new software releases and invoking the OBS API to version pump the packages that got updated, so that they are rebuilt/re-packaged

  
## Prerequisites

1. The following repository secrets must be created before the CI can invoke OBS API endpoints:
    - `OBS_CREDENTIALS`: OBS user credentials to invoke some OBS API endpoints (`$OBS_Username:$OBS_Password`)
    - `OBS_PROJECT_LIST`: The OBS projects that you want this workflow to manage (one per line)
    - `OBS_TOKEN`: OBS token with privileges to run package services in your home project, this is a legacy requirement and is still used by `util/pkg-trigger:ServiceRunRequestToken` which is now unused, but still perfectly functional and may be re-used in a future releases, you can set this to a random value for the time being.

2. A special `_pkg_info` file in each package in your managed projects (those in `$OBS_PROJECT_LIST`)


## References: API Documentations Used

1. Github
	- [Get the latest release](https://docs.github.com/en/enterprise-server@3.20/rest/releases/releases?apiVersion=2022-11-28#get-the-latest-release)
	- [Tags](https://docs.github.com/en/rest/git/tags?apiVersion=2022-11-28)

2. [Open Build Service](https://api.opensuse.org/apidocs/index#)
3. [release-monitoring.org](https://release-monitoring.org/static/docs/api.html)
