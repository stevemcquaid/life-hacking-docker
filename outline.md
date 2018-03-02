# Life-Hacking with Containers: Automate away your problems

# Description
As a software engineer, I look for ways to make my life easier. In this lively talk we will discuss some of the problems I've faced, from  to dealing with slow ISPs, and how I've managed to make my life easier with Python and some docker magic.

# Premise

As a software engineer I look for solutions to make my life easier.

So much of what we do day to day can be automated.

### How can we become efficient in creating automation?
    Frameworks to make us efficient can increase productivity.
    Must be functional, portable, iteratable and easily understandable.
    From an Infrastructure perspective, challenge = bootstrapping/dependency hell
        Docker allows functionality, portability.

### Why
    Quickly do something that was laborious before
    Fun
    Because we can.

# Principles
    Portable
        - Assume docker, bash (optional, but usable without), make (optional)
    Quick to build/use/modify
    Easy to understand

# Basic Process
    Write code to do something
    Get a shell in ubuntu container, install the stuff that you need.
    Convert to dockerfile
    Wrap with utility scripts

# Learnings
    Not all networks are fast - long time to compile, slow iterations
    Production and development are different (dont multiline apt-get installs)
    Find base images for your commonly used languages, reuse patterns that work well
    Have common structure & boiler plate ready to go
    Polishing cli programs is complicated
        - common argparse framework
    Patterns for sensitive information
        - veracrypt

# Examples:
    Projects
    Narrative/Learnings
        Use bash when you know commands-> ubuntu
            - 
        Write code when you dont -> have bindings ready
    Pre Built
        isp test
        weechat

## Learnings / Patterns
    Make + Bash Scripts
    Starter Code
    Document in Code
        make Help/Readme + docker container working
        