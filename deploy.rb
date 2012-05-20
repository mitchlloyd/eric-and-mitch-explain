=begin
bundle exec middleman build
mv build /tmp/eric-and-mitch-build
git checkout gh-pages
rm -rf ./*
rm -r /tmp/eric-and-mitch-build
mv /tmp/eric-and-mitch-build/* .
git add .
git commit -m "Build the site and add the content to gh-pages."
git push origin gh-pages
git checkout master
=end

require 'git'

class GitHubPagesDeploy
  def initialize( site_path = 'build', branch = 'gh-pages' )
    @site_path = site_path
    @branch    = branch
  end

  def run
    git.status.changed.empty? ? publish_site : message_for(:existing_changes)
  end

  private
  def git
    @git ||= Git.open('.')
  end

  def publish_site
    current_branch = git.branch
    checkout_pages_branch
    add_and_commit_site @site_path
    push_and_restore current_branch
  end

  def checkout_pages_branch
    git.branch( @branch ).checkout
  end

  def add_and_commit_site( path )
    git.with_working( path ) do
      git.add(".")
      begin
        git.commit("Published #{@branch} to GitHub pages.")
      rescue Git::GitExecuteError => e
        $stderr.puts "Can't commit. #{e}."
      end
    end
  end

  def push_and_restore( original_branch )
    git.reset_hard
    git.push( 'origin', @branch )
    git.checkout( original_branch )
  end

  def message_for( key )
    $stderr.puts case key
    when :existing_changes
      "You have uncommitted changes in the working branch. Please commit or stash them."
    else
      "An error occured."
    end
  end
end

GitHubPagesDeploy.new.run