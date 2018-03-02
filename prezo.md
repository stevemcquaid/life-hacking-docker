# Life-Hacking with Containers: Automate away your problems

# Dockering Everything
    
   
    Hello I am Steve McQuaid.
    As many of you probably do, I enjoy looking for ways to make my life easier and more efficient.
    In this talk I'd love to share some of the problems I've faced, from editing markdown to dealing with slow ISPs, 
    and how I've managed to make my life easier by attempting to dockerize everything in sight
    
    
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
* Quick to build/use/modify
* Easy to understand

<!-- notes -->


--- 

# Automation Requirements

* Utilize Convention
* Functional
* Portable
* Iteratable
* Easily Understood

<!-- From an Infrastructure perspective, challenge = bootstrapping/dependency hell
Docker allows functionality, portability. -->

---

# Basic Process

1. Write the code to do something
2. Get a shell in ubuntu container, install the stuff that you need.
3. Convert to dockerfile
4. Wrap with utility scripts

---

# Learnings
* Not all networks are fast - long time to compile, slow iterations
* Production and development are different (dont multiline apt-get installs)
* Find base images for your commonly used languages, reuse patterns that work well
* ave common structure & boiler plate ready to go
* Polishing cli programs is complicated
    * common argparse framework
* Patterns for sensitive information
    * Encryption
---

# Examples:


Projects
Narrative/Learnings
    Use bash when you know commands-> ubuntu
        - 
    Write code when you dont -> have bindings ready
Pre Built
    isp test
    weechat

---

## Learnings / Patterns
    Make + Bash Scripts
    Starter Code
    Document in Code
        make Help/Readme + docker container working
    