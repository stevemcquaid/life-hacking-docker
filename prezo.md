# Dockering Everything

    Hello I am Steve McQuaid.
    As many of you probably do, I enjoy looking for ways to make my life easier and more efficient.
    In this talk I'd love to share some of the problems I've faced, from editing markdown to dealing with slow ISPs, 
    and the lessons I've learned whi to make my life easier by dockerizing everything in sight
    
    
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
    * Assume docker, bash (optional, but usable without), make (optional)
* Easy to understand
* Quick to build/use/modify

<!-- The main points I try to keep in mind while developing small projects for utility use are: portability.
Want to be able to run anywhere - on a new machine easily. We can assume every machine will have docker, and likely bash or a similar enough shell that we can patch things easily. I have been recently using make to keep CLI arguments short and avoid typing the 50 characters for some docker commands.
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

<!-- The basic progress of developing custom solutions typically looks like this.
Write the main code.
Get a shell, manually run and debug the commands.
Put commands in a dockerfile.
Add util scripts to project
Document -->
---

# Learnings

* Not all networks are fast - long time to compile, slow iterations
* Production and development are different (dont multiline apt-get installs)
* Find base images for your commonly used languages, reuse patterns that work well
* Have common structure & boiler plate ready to go
* Polishing cli programs is complicated
    * common argparse framework
* Patterns for sensitive information
    * Encryption

<!-- While the last bit was obvious, some things I've run into after doing this for a few dozen projects are:
Image bloat is a real thing. I will typically start with ubuntu 16 image since its pretty universal of the major distros, But whenever possible I'll use a language specific alpine image to cut down on bloat.
For utility scripts its ok to favor non-optimal solutions such as splitting apt-get installs to multiple lines. Avoids dependency hell occassionally.
I mentioned language specific alpine images. Having language specific boiler plate code saves A TON of time and can really speed up dev (python caching requirements).
Similarly, have common argparse frameworks ready to go to add the exact logic you want.
A pattern that is fairly new to me, but I am beginning to develop is: encrypted volumes stored with the repos. Avoids splilling passwords in github or dockerhub. And more convenient to transport across environments. -->

---

# Examples:

* weechat-docker-otr
    #### Purpose
    Be able to access all chat platforms from the command line. Be able to communicate with only a terminal
    #### Challenges
    Dependency hell. Learning weechat commands. Setup of accounts/config file & state managements
    #### Learnings/Solutions
    Break out apt installs. Encrypt config files. Built own documentation if it would take too long to automate your own solution.
* internet-speedtest-docker
    #### Purpose
    Monitor the real-time speed from ISP. Graph it to know when stuff breaks and when speeds slow.
    #### Challenges
    Converting compose to k8s. Running persistantly somewhere in local network. Exposing the docker port beyond minikube
    #### Learnings/Solutions
    Have templates. Have a dev machine run kubernetes. use haproxy in docker container to redirect to the minikube port
* haproxy
    #### Purpose
    Be able to redirect traffic at will. (Reverse Proxy)
    #### Challenges
    Forward traffic to a different ip/port, Easily mapping to/from ports in a simple manner
    #### Learnings/Solutions
    Use haproxy in a docker container. Use simple config file
* grip
    #### Purpose
    View rendered output of github-flavor markdown live on local computer.
    #### Challenges
    Be portable across Mac/Linux. 
    #### Learnings/Solutions
* otp/gauth
    #### Purpose
    #### Challenges
    #### Learnings/Solutions
* grypt
    #### Purpose
    #### Challenges
    #### Learnings/Solutions
* sigterm
    #### Purpose
    #### Challenges
    #### Learnings/Solutions
* toolbox
    #### Purpose
    #### Challenges
    #### Learnings/Solutions
* err-openstack
    #### Purpose
    #### Challenges
    #### Learnings/Solutions
* pdf title rename
    #### Purpose
    #### Challenges
    #### Learnings/Solutions
* pdf-unlocker
    #### Purpose
    #### Challenges
    #### Learnings/Solutions
* govim
    #### Purpose
    #### Challenges
    #### Learnings/Solutions
* md2pdf
    #### Purpose
    #### Challenges
    #### Learnings/Solutions

---

## Learnings / Patterns
    * Make + Bash Scripts 
        * Allow common interfaces to cli tools written in different languages on different platforms. Can include in bash_profile easily.
    * Starter Code
        * Having some place to start makes a huge difference in productivity.
    * Document in Code
        * `make help`/Readme for quick usage reference
        * Working docker container that can be pulled from public repo is also hugely helpful
    