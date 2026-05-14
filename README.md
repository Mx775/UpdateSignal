# UpdateSignal

My personal workflow to automate the process of updating the software I have hosted on OBS (openSUSE's Open Build Servive), by automatically checking for new software releases and invoking the OBS API to version pump the packages that got updated, so that they are rebuilt/re-packaged

  
## Prerequisites

1. The following repository secrets must be created before the CI can invoke OBS API endpoints:
    - `OBS_CREDENTIALS`: OBS user credentials to invoke some OBS API endpoints (`$OBS_Username:$OBS_Password`)
    - `OBS_PROJECT_LIST`: The OBS projects that you want this workflow to manage (one per line)
    - `OBS_TOKEN`: OBS token with privileges to run package services in your home project, this is a legacy requirement and is still used by `util/pkg-trigger:ServiceRunRequestToken` which is now unused, but still perfectly functional and may be re-used in a future releases, you can set this to a random value for the time being. Uploading `_pkg_info` will trigger the package services anyway

2. A special `_pkg_info` file in each package in your managed projects (those in `$OBS_PROJECT_LIST`).


## Important Notes
1. Your password must NOT include a double quote (`"`). This limitation is imposed because of how credentials are passed to curl using *process substitution* `<(cmd)`. It should work, but untested. I am not sure whether any other special characters could be problem in a `curl` config. Experiment!

2. The `_pkg_info` file acts as a *marker*, which is used for:
    - Mark each package managed by this workflow, instead of hard-coding.
    - Determine the current version of the package and perform version pumps when needed
    - Some packages' `_service` definitions use it to set the new version for the package

#### Example `_pkg_info` file:

```
Upstream: firefox
Version: 150.0.3
```

**NOTE**: `Upstream` can be set to a/an:
	- Project name on [Anitya](https://release-monitoring.org)
	- Github repo url
	- AUR package url
	- Omitted, in which case, the package name is used as a project name & checked with [Anitya](https://release-monitoring.org)

#### Example `_service` file using `_pkg_info`

```xml
<services>
	<service name="set_version">
		<param name="fromfile">_pkg_info</param>
	</service>
	
	<service name="download_files"/>
</services>
```

## References: API Documentations Used

1. Github
	- [Get the latest release](https://docs.github.com/en/enterprise-server@3.20/rest/releases/releases?apiVersion=2022-11-28#get-the-latest-release)
	- [Tags](https://docs.github.com/en/rest/git/tags?apiVersion=2022-11-28)

2. [Open Build Service](https://api.opensuse.org/apidocs/index#)
3. [release-monitoring.org](https://release-monitoring.org/static/docs/api.html)
