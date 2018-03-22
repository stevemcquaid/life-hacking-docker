# Dockering Everything

<!-- Hello I am Steve McQuaid.
As many of you probably do, I enjoy looking for ways to make my life easier and more efficient.
In this talk I'd love to share some of the problems I've faced, from editing markdown to dealing with slow ISPs, 
and the lessons I've learned whi to make my life easier by dockerizing everything in sight
 -->

# Why?

* Save time.
* It is Fun.
* Because we can.

<!-- Why would we want to dockerize and automate things?
Want to be able to quickly do something that was previously laborious.
Buildling things is enjoyable
Why not exercise our abilities and creativity -->

---

# Principles

* Portable
    * Assume docker, bash, [make]
* Easy to understand
* Quick to build/use/modify

<!-- The main points I try to keep in mind while developing small projects for utility use are: 
portability.
Want to be able to run anywhere - on a new machine easily. 
We assume every machine will have docker, and likely bash or a similar enough shell that we can patch things easily. I have been recently using make to keep CLI arguments short and avoid typing the 50 characters for some docker commands.
It should be easily understood by looking at the code or documentation. Since this is likely not oging to be maintained by anyone but us, we want to make life easily for our future selves. So I definitely favor legibility and clarity of code over efficiency and elegant oneliners. 
As a result, if we need to change something in the future, it should be easy to do so. -->

--- 

# Requirements

* Utilize Convention
* Functional
* Portable
* Iteratable
* Clear Logic

<!-- Given those principles, I use this mental checklist to make sure Im not creating a hassle for future me. 
From an Infrastructure perspective, challenge = bootstrapping/dependency hell
Docker specifically allows functionality, portability. -->

---

# Basic Process

1. Write the code to do something
2. Get a shell in ubuntu container, install the stuff that you need.
3. Convert to dockerfile
4. Wrap with utility scripts
5. Create Documentation

<!-- The basic progress of developing custom solutions typically looks like this.
Write the main code.
Get a shell, manually run and debug the commands.
Put commands in a dockerfile.
Add util scripts to project
Document -->

---

# Examples:

### weechat-docker-otr
    #### Purpose
    Be able to access all chat platforms from the command line. Be able to communicate with only a terminal
    #### Challenges
    Dependency hell. Learning weechat commands. Setup of accounts/config file & state managements
    #### Learnings/Solutions
    Break out apt installs. Encrypt config files. Built own documentation if it would take too long to automate your own solution.
### internet-speedtest-docker
    #### Purpose
    Monitor the real-time speed from ISP. Graph it to know when stuff breaks and when speeds slow.
    #### Challenges
    Converting compose to k8s. Running persistantly somewhere in local network. Exposing the docker port beyond minikube
    #### Learnings/Solutions
    Have templates. Have a dev machine run kubernetes. Use haproxy in docker container to redirect to the minikube port
### haproxy
    #### Purpose
    Be able to redirect traffic at will. (Reverse Proxy)
    #### Challenges
    Forward traffic to a different ip/port, Easily mapping to/from ports in a simple manner
    #### Learnings/Solutions
    Use haproxy in a docker container. Use simple config file
### grip
    #### Purpose
    View rendered output of github-flavor markdown live on local computer.
    #### Challenges
    Be portable across Mac/Linux. Handle live refreshes in browser. Rate limiting. Be accessible from any shell context 
    #### Learnings/Solutions
    Its easy to alias shell scripts in bash profile. Make becomes a wrapper. Have a common binding for languages to make life easy.
### otp/gauth
    #### Purpose
    Be able to backup/access/use 2FA codes on a computer
    #### Challenges
    Security of configuration codes. golang language bindings
    #### Learnings/Solutions
    Veracrypt allows in-memory storage of sensitive information with a common mounting point. Allows program to treat configs like regular files, but be securely stored at rest.
### grypt
    #### Purpose
    More secure in memory storage of secrets
    #### Challenges
    Codes should be accessible as files to other programs. Should reencrypt when the program exits.
    #### Learnings/Solutions
    sigterm pattern within golang program using docker's kill signal
### sigterm
    #### Purpose
    Create a starter pattern to allow cleanup when a SIGTERM is given in golang
    #### Challenges
    Assure sigterm gets handled correctly before being killed
    #### Learnings/Solutions
    Create sigterm handler - make sure docker send SIGTERM in the runtime environment. Document code and provide clean bindings for use.
### toolbox
    #### Purpose
    Create a utility debugger for poking around in unfamiliar environments. Often my starter Dockerfile on top of ubuntu:16.04
    #### Challenges
    Installing a bunch of packages and assuring none collide
    #### Learnings/Solutions
    Its not intended for production so there is no need to do oneliners.  Keep a dockerfile cache active for these massive containers.
### err-openstack
    #### Purpose
    Automate 
    #### Challenges
    Picking the right bot framework. Needs to communicate with slack but also openstack apis in a friendly language. Auth is hard. Also for development, should be able to run with new code and still work. Python should not have to install requirements every run.
    #### Learnings/Solutions
    Provide access to user on team (backed by Active Directory). Would want to create formal api in future and leave the bot to just handle Auth and slack parsing. Add requirements into container before code. Then dockerfile will be rebuild only when requirements change.
### pdf-title-rename
    #### Purpose
    I hoard ebooks. Often times the filename is mislabeled.  Have an easy way to rename large archives of ebooks
    #### Challenges
    Find the right solution prebuilt. Then Dockerize it. Create bindings to pass in files to docker container.
    #### Learnings/Solutions
    Using someone else's work is awesome!
### pdf-unlocker
    #### Purpose
    Need to sign document, but it requires Adobe Software to edit.
    #### Challenges
    Volume mounting. Bindings to enable future use easily
    #### Learnings/Solutions
    Using someone else's work is awesome! Streamlining the "Dockerization" process helps to save time!
### gaws
    #### Purpose
    Be able to quickly run a docker container exposed to the internet (ec2)
    #### Challenges
    You need to setup AWS IAM keys ahead of time, no API to allow UN/PS -> creds.
    #### Learnings/Solutions
    This was a challenge is restraint from adding everything as a CLI flag. Keep it simple, write clean code. Make reasonable assumptions (didnt need vpc or ami_id discovery to accomplish the task)
### vim-ide
    #### Purpose
    Be able to have the same full-featured development environment on any machine, anywhere in the world.
    #### Challenges
    I'm a nano user (GASP). I both needed to learn vim and the packaging around it (pathogen/vundle). There are some nearly complete prebuilt containers, but I needed to simplify to understand it. Also, its rare that I use a single language in a single day. I need support for python and golang, and a foundation to add support for anything else that comes up. (JSFOTW)
    #### Learnings/Solutions
    Use what works, (ubuntu) rather than a fancy alpine image that you can interact with and learn from. Be agile (make something that works, then iterate). Since this is a high-interaction container, worry less about the glue/wrappers around the container, and focus on getting the container functional. Dogfood. Build the container in the container... use vim to create the dockerfile and vim bindings as a mounted src volume.

---

# Learnings

* Not all networks are fast - long time to compile, slow iterations
* Production and development are different (dont multiline apt-get installs)
* Find base images for your commonly used languages, reuse patterns that work well
* Starter Code
    * Having code in place helps productivity 
    
* Make + Bash Scripts 
        * Allow common interfaces to cli tools written in different languages on different platforms. Can include in bash_profile easily.
* Document in Code
    * `make help`/Readme for quick usage reference
    * Working docker container that can be pulled from public repo is also hugely helpful
* Polishing cli programs is complicated
    * common argparse framework
* Patterns for sensitive information
    * Encryption

<!-- While the last bit was obvious, some things I've run into after doing this for a few dozen projects are:
Image bloat is a real thing. I will typically start with ubuntu 16 image since its pretty universal of the major distros, But whenever possible I'll use a language specific alpine image to cut down on bloat.
For utility scripts its ok to favor non-optimal solutions such as splitting apt-get installs to multiple lines. Avoids dependency hell occassionally.
I mentioned language specific alpine images. Having language specific boiler plate code saves A TON of time and can really speed up dev (python caching requirements).
Have common structure & boiler plate ready to go
Similarly, have common argparse frameworks ready to go to add the exact logic you want.
A pattern that is fairly new to me, but I am beginning to develop is: encrypted volumes stored with the repos. Avoids splilling passwords in github or dockerhub. And more convenient to transport across environments. -->
