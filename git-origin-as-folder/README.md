# Introduction
Setup a quick dev environment with a git remote origin to a folder, synced to the cloud (Dropbox or similar)

# remote side
```bash
# go to root folder
cd /path/to/sync/folder
mkdir git_repos
cd git_repos

# make an empty bare repo
git init --bare repo-name.git
```

# local side
## New repo
```bash
git clone file:///path/to/sync/folder/repo-name.git
```

## Existing repo
```bash
# go to exiting repo
cd /path/to/existing/repo

# look at existing remote
git remote -v

# Change the remote origin URL
git remote set-url origin file:///path/to/sync/folder/repo-name.git

# Push to the new remote origin
git push origin master
```
