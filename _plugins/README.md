# Automatic generation of the gh-pages branch from the master one using travis

As we are using a rb plugin to generate pages for each categories of the site, and as github-pages does not accept plugins, 
we need to generate the site by ourselves on a specific branch named gh-pages

To carry out the compilation and the final git push, a specific script [deploy.sh](../deploy.sh) can be found at the root of the master branch

The most important part is to establish a SSH link between travis and the github repo, which relies on the use of SSH keys :
- the github directory will be granted the public SSH key as a deploy key
- the travis bot will have the possibility to regenerate the private SSH key using an ENCRYPTED version of the original private key

The steps to reproduce in order to recreate the SSH credentials are :
- create the key which consists of two files (dromotherm_rsa and dromotherm_rsa.pub)
- encrypt the generated deploy key with the Travis client. The resulting file will be dromotherm_rsa.enc

This will be achieved on a linux VM machine with bundle already installed. 
If it's a command line only machine, the possibility to exchange file(s) with the window host via samba will be used.

Once on the window machine, the public key will be copied to the clipboard and injected in the github repo as a deploy key

Nota : I encountered problems generating directly the SSH key on a windows machine !

## initialize the github repo on the linux machine

```
cd ~
git clone http://dromotherm.github.com/blog
cd blog
git status
```

## SSH key generation

IT IS ESSENTIAL TO INDICATE A BLANK OR EMPTY PASSPHRASE 

```
ssh-keygen -t rsa -b 4096 -C "alexandre.cuer@cerema.fr"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/pi/.ssh/id_rsa): dromotherm_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in dromotherm_rsa.
Your public key has been saved in dromotherm_rsa.pub.
The key fingerprint is:
SHA256:QMhUil+QceEQe/lIuqiXAYEONQ311t+molzRzlRMcGU alexandre.cuer@cerema.fr
The key's randomart image is:
+---[RSA 4096]----+
|..+*B*=.  ..o.E  |
|+  o=X o   + .   |
|o.. o X .   o    |
|.. . * + o o     |
| .  o . S + o    |
|  .. .   = o     |
|  .o.   o +      |
| .o  . o .       |
|..    o          |
+----[SHA256]-----+
```

## exhange the key with the window host and configure the github repo

we assume that the /var/www/colibri folder is shared between the host and the VM

```
cp dromotherm_rsa /var/www/colibri/dromotherm_rsa
cp dromotherm_rsa.pub /var/www/colibri/dromotherm_rsa.pub
```
On the window machine, once the pub file has been copied for example to 
/C/Users/alexandre.cuer/Documents/GitHub/blog, launch a git bash and copy the content of the pub key top the clipboard :

```
cd /C/Users/alexandre.cuer/Documents/GitHub/blog
clip < dromotherm_rsa.pub
```
Create a new deploy key through the settings page of the repo in Github :

`https://github.com/<your name>/<your repo>/settings/keys`

choose allow write access in order for the key to be able to push (Read/write mode)

## create the encrypted key

Login to travis using yout github username and pass

```
travis login --org
```

```
travis encrypt-file dromotherm_rsa --add
Detected repository as dromotherm/blog, is this correct? |yes| yes
encrypting dromotherm_rsa for dromotherm/blog
storing result as dromotherm_rsa.enc
DANGER ZONE: Override existing dromotherm_rsa.enc? |no| yes
storing secure env variables for decryption

Make sure to add dromotherm_rsa.enc to the git repository.
Make sure not to add dromotherm_rsa to the git repository.
Commit all changes to your .travis.yml.
```

The `travis encrypt-file dromotherm_rsa --add` command generates an encryption label `05e522b11dc9` and 
directly modifies the .travis.yml file

the final .travis.yml should be like that :
```
language: ruby
rvm:
- 2.6.3
before_script:
- chmod +x ./deploy.sh
script:
- bash ./deploy.sh
- ls -al
env:
  global:
  - NOKOGIRI_USE_SYSTEM_LIBRARIES=true
  - COMMIT_AUTHOR_EMAIL: alexandre.cuer@cerema.fr
  - ENCRYPTION_LABEL: 05e522b11dc9
sudo: false
before_install:
- openssl aes-256-cbc -K $encrypted_05e522b11dc9_key -iv $encrypted_05e522b11dc9_iv
-in dromotherm_rsa.enc -out dromotherm_rsa -d
```
The line `- ENCRYPTION_LABEL: 05e522b11dc9` defines a variable used by the deploy.sh file

Don't know if the before_install command is necessary, as the deploy.sh file contains a very similar command



## commit the encrypted file to the github repo

now everything should be OK

.travis.yml and dromotherm_rsa.enc can be committed to the github repo

```
nano .travis.yml
git add .travis.yml
git add dromotherm_rsa.enc
git config --global user.email "alexandre.cuer@cerema.fr"
git config --global user.name "alexandrecuer"
git commit -m "new encrypted credentials..."
git push
```

## ignored files

Please note that the [.gitignore](../.gitignore) file looks like that :
```
_site
.sass-cache
.jekyll-metadata
dromotherm_rsa
dromotherm_rsa.pub
Gemfile.lock
```

so if a local repo contains the original credentials, they will never be committed to the github repo


## extra information

just check :

https://simpleit.rocks/ruby/jekyll/tutorials/automated-deployment-of-jekyll-websites-to-github-pages-with-a-git-push-to-github/

https://gist.github.com/domenic/ec8b0fc8ab45f39403dd

https://docs.travis-ci.com/user/encrypting-files/
