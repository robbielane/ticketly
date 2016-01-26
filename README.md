
---
[![Stories in Ready](https://badge.waffle.io/robbielane/ticketly.png?label=ready&title=Ready)](http://waffle.io/robbielane/ticketly)

[![Throughput Graph](https://graphs.waffle.io/robbielane/ticketly/throughput.svg)](https://waffle.io/robbielane/ticketly/metrics)

##### [Aaron Careaga](https://github.com/acareaga), [Adam Jensen](https://github.com/adamki), [Jhun De Andres](https://github.com/joshuajhun), [Robbie Lane](https://github.com/robbielane)

The Pivot is the first project in Module 3 at the Turing School. Each group are given a legacy project to work with. We started with a site called Global Pursuit, a tourism/hosting platform. We are pivoting from [Global Pursuit](http://github.com/toriejw/global-pursuit).

[Project Outline](https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/the_pivot.md) | [Heroku](http://ticketly.herokuapp.com/)

![Ticketly](http://www.aaroncareaga.com/wp-content/uploads/2016/01/Screen-Shot-2016-01-21-at-10.51.03-AM.png "Ticketly")

### Instructions

* clone the project in your terminal by running `git clone git@github.com:robbielane/ticketly.git`
* start the server with `rails s` and visit `http://localhost:3000` in your preferred browser
* to run the tests, run `bundle exec rake test` in the terminal

### Areas of Focus

* Working with Multitenancy
* Implementing JavaScript
* Securing a Rails App
* Sending Email
* Creating Seed files

### Git Workflow

**Starting a new branch**

* checkout a branch named after the waffle story and include the number
* Squash and order commits by spec
* Push branch and tag with [WIP] until story is completed

**Creating a Pull Request**

* close the waffle issue on GitHub
* Notify group members on Slack when PR is ready for code review
* Aim to have the PR reviewed within 45 minutes of submission
* Fix eventual Hound errors before merging the PR
* The group member that merges the PR should
* delete the branch on GitHub
* notify the group members on Slack to pull from master
