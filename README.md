# Product Reviews Rails App

This is a Ruby on Rails project that allows users to submit product reviews and view reviews submitted by other users.

You can access and register to test the online version at: https://product-reviews.fly.dev/

## Description

The application consists of a basic interface that allows users to submit product reviews. Each review can include text and an optional rating from 1 to 5.

## Features

### Submit Reviews

- **Feature**: Users can submit the text of their reviews.
- **How it works**: On the homepage, users can find a form to submit a new review. They will need to enter the review text and optionally a rating from 1 to 5 before submitting.

### Rate Reviews

- **Feature**: Optionally, users can rate their reviews with a score from 1 to 5.
- **How it works**: Along with the review text, users can select a score from 1 to 5 before submitting their review.

### View Other Users' Reviews

- **Feature**: Users can view the reviews that have been submitted by other users.
- **How it works**: In a dedicated section or on the homepage, users can see a list of all reviews submitted by other users. Each review will display the text and rating.

## Requirements

- Ruby (version specified in `Gemfile`)
- Rails (version specified in `Gemfile`)
- PostgreSQL
- Fly.io CLI

## Initial Setup

### Install Dependencies

To install the necessary gems, run:

```bash
bundle install
```

### Database Setup

rails db:create
rails db:migrate

## Deployment with Fly.io
Install Fly.io CLI
First, you need to install the Fly.io CLI. Detailed instructions can be found in the official Fly.io documentation.

```
flyctl auth login
flyctl deploy
```