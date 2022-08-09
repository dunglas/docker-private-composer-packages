# Reproducer: Docker Compose Secret File Not Mounted

Following [my article "Securely Access Private Git Repositories and Composer Packages in Docker Builds"](https://dunglas.fr/2022/08/securely-access-private-git-repositories-and-composer-packages-in-docker-builds/) and [this discussion on Twitter](https://twitter.com/benjamindavies/status/1556900014965899269), I tried to use an `auth.json` file mounted as a Docker secret file to download private Composer packages.

First, create a local `auth.json` file containing a GitHub Personal Access Token and update `composer.json` to reference a private package:

```json
{
    "github-oauth": {
        "github.com": "ghp_<your-token>"
    }
}
```

Then, it works as expected with Docker: `docker build --secret id=composer_auth,src=auth.json .`

But it doesn't with Docker Compose: `docker compose build`
