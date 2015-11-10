# Github Stats

## What is this?

Aggregate statistics for your GitHub organization.

View pull requests and comments by repository or by user.

How else can you see all pull requests submitted by a user across all repos in your organization?

## Usage

You need to set three environment variables:

`GITHUB_USERNAME`
- This is pretty much what it sounds like.

`GITHUB_PASSWORD`
- This can be a [personal access token](https://github.com/settings/tokens)

`GITHUB_ORGANIZATION`
- Defaults to Foraker, because we're selfish

After you've set these, you can import all your GitHub data. If you don't set these, you'll hit an API limit.

`rake github:import`

Then, create a user. You can use [db/seeds.rb](db/seeds.rb) if you need ideas.

Then, fire up that server (`rails s`), sign in, and explore.

## About Foraker Labs

![Foraker Logo](http://assets.foraker.com/attribution_logo.png)

Foraker Labs builds exciting web and mobile apps in Boulder, CO. Our work powers a wide variety of businesses with many different needs. We love open source software, and we're proud to contribute where we can. Interested to learn more? [Contact us today](https://www.foraker.com/contact-us).

This project is maintained by Foraker Labs. The names and logos of Foraker Labs are fully owned and copyright Foraker Design, LLC.
