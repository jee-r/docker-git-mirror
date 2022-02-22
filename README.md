# docker-git-mirror

A GitHub Action for mirroring a repository to another repository on GitHub, GitLab, Gitea, etc.

## Usage
In this example we want mirroring the repository `foobar` to gitlab and to a self-hosted gitea instance.

*mickeymouse* is the namespace for both repo

### Secrets

You need to add the following secrets on the repository you want mirroring

- for gitlab :
    - `GITLAB_USER`: your username on gitlab (*mikeymouse*) 
    - `GITLAB_TOKEN`: your read and write gitlab token (*long alpha numeric string*)
- For gitea
    - `GITEA_USER`: your username on gitea (*mikeymouse*) 
    - `GITEA_TOKEN`: your read and write gitea token (*long alpha numeric string*)

### Workflow  

Add the code below in your repository in `.github/workflows/mirroring.yaml`

```
name: Mirroring to remote repos
on:
  push:
    branches:
      - main
      - dev
jobs:
  mirroring:
    name: Mirror
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
      - name: mirror to gitlab.com
        uses: jee-r/docker-git-mirror@v1
        with:
          remote_repo: "gitlab.com/mickeymouse/foobar.git"
          remote_repo_username: ${{ secrets.GITLAB_USER }}
          remote_repo_password: ${{ secrets.GITLAB_TOKEN }}
      - name: mirror to mygitea.com
        uses: jee-r/docker-git-mirror@v1
        with:
          remote_repo: "mygitea.com/mickeymouse/foobar.git"
          remote_repo_username: ${{ secrets.GITEA_USER }}
          remote_repo_password: ${{ secrets.GITEA_TOKEN }}

```

# License

This project is under the [GNU Generic Public License v3](/LICENSE) to allow free use while ensuring it stays open.
