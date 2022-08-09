# Example: Securely Access Private Composer Packages

Following [my article "Securely Access Private Git Repositories and Composer Packages in Docker Builds"](https://dunglas.fr/2022/08/securely-access-private-git-repositories-and-composer-packages-in-docker-builds/) and [this discussion on Twitter](https://twitter.com/benjamindavies/status/1556900014965899269), here is an example of how to use an `auth.json` file mounted as a Docker secret file to download private Composer packages.

First, create a local `auth.json` file containing a GitHub Personal Access Token and update `composer.json` to reference a private package:

```json
{
    "github-oauth": {
        "github.com": "ghp_<your-token>"
    }
}
```

Build with Docker Compose: `docker compose build`

Build with Docker: `docker build --secret id=composer_auth,src=auth.json .`
