# UpdateSignal

My personal workflow to automate the process of updating the software I have hosted on OBS (openSUSE's Open Build Servive), by automatically checking for new software releases and invoking the OBS API to version pump the packages that got updated, so that they are rebuilt/re-packaged

  
## Prerequisites

1. Update `pkg.lists.sh` per your needs
2. The following repository secrets must be created before the CI can invoke OBS API endpoints:
    - `ACCESS_VARIABLES_TOKEN`: A github fine-grained access token with read/write access to actions variables of this repo
    - `OBS_CREDENTIALS`: OBS user credentials to invoke some OBS API endpoints (`$OBS_Username:$OBS_Password`)
    - `OBS_HOME_PROJECT`: OBS user home project (`home:$OBS_Username`)
    - `OBS_TOKEN`: OBS token with privileges to run package services in your home project, this is a legacy requirement and is still used by `util/refresh-catalog:ServiceRunRequestToken` which is now unused, but still perfectly functional and may be re-used in future releases, you can set this to a random value for the time being.

  
## References: API Documentations Used

1. Github
	- [Repository variables](https://docs.github.com/en/rest/actions/variables?apiVersion=2022-11-28#list-repository-variables)
	- [Get the latest release](https://docs.github.com/en/enterprise-server@3.20/rest/releases/releases?apiVersion=2022-11-28#get-the-latest-release)
	- [Tags](https://docs.github.com/en/rest/git/tags?apiVersion=2022-11-28)

2. [Open Build Service](https://api.opensuse.org/apidocs/index#)
3. [release-monitoring.org](https://release-monitoring.org/static/docs/api.html)

