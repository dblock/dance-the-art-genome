Contributing to Dance-The-Art-Genome
====================================

Dance-The-Art-Genome is a [collaborative project](https://github.com/dblock/dance-the-art-genome/graphs/contributors). You're encouraged to submit [pull requests](https://github.com/dblock/dance-the-art-genome/pulls), [propose features and discuss crazy ideas](https://github.com/dblock/dance-the-art-genome/issues), etc.

#### Crazy Ideas

Yes, please.

#### Fork the Project

Fork the [project on Github](https://github.com/dblock/dance-the-art-genome) and check out your copy.

```
git clone https://github.com/contributor/dance-the-art-genome.git
cd dance-the-art-genome
git remote add upstream https://github.com/dblock/dance-the-art-genome.git
```

#### Install Node.js

It is recommended to use the [nvm](https://github.com/creationix/nvm) tool to manage node versions and install node.

First install NVM.

```
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
```

Then install the latest node.

```
nvm install 0.10
```

Then tell nvm to use the latest version of node by default and to update your PATH

```
nvm alias default 0.10
```

#### Run the Project

```
$ make s

Artsy API at https://api.artsy.net/api ...
Listening on port 4000
```

Navigate to http://localhost:4000 to see it.

#### Create a Topic Branch

Make sure your fork is up-to-date and reate a topic branch for your feature or bug fix.

```
git checkout master
git pull upstream master
git checkout -b my-feature-branch
```

#### Commit Changes

Make sure git knows your name and email address:

```
git config --global user.name "Your Name"
git config --global user.email "contributor@example.com"
```

Writing good commit logs is important. A commit log should describe what changed and why.

```
git add ...
git commit
```

#### Push

```
git push origin my-feature-branch
```

#### Make a Pull Request

Go to https://github.com/contributor/dance-the-art-genome and select your feature branch. Click the 'Pull Request' button and fill out the form. Pull requests are usually reviewed within a few days.

#### Rebase

If you've been working on a change for a while, rebase with upstream/master.

```
git fetch upstream
git rebase upstream/master
git push origin my-feature-branch -f
```

#### Check on Your Pull Request

Go back to your pull request after a few minutes and see whether it passed muster with Travis-CI. Everything should look green, otherwise fix issues and amend your commit as described above.

#### Be Patient

It's likely that your change will not be merged and that the nitpicky maintainers will ask you to do more, or fix seemingly benign problems. Hang on there!

#### Thank You

Please do know that we really appreciate and value your time and work. We love you, really.
