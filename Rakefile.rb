require 'rake/clean'
require 'redcloth'
require 'stringex'
require 'fileutils'

DRAFTS_DIR = '_drafts'
POSTS_DIR = '_posts'
BUILD_DIR = '_site'
DEPLOY_BRANCH = 'master'

CLEAN.include BUILD_DIR

desc 'Build the site'
task :build do
  ENV["JEKYLL_ENV"] = "production"
  ENV["NODE_ENV"] = "production"
  sh 'jekyll', 'build'
  sh 'yarn', 'run', 'build'
end

desc 'Start web server to preview site'
task :preview do
  ENV["JEKYLL_ENV"] = "development"
  ENV["NODE_ENV"] = "development"
  sh 'yarn', 'run', 'build'
  sh 'jekyll', 'serve', '--watch', '--drafts',
     '--port', ENV.fetch('PORT', '4000')
end

desc 'Create a new draft'
task :new_draft, :title do |t, args|
  title = args[:title] || 'New Draft'
  filename = File.join(DRAFTS_DIR, "#{title.to_url}.md")

  puts "==> Creating new draft: #{filename}"
  open(filename, 'w') do |f|
    f << "---\n"
    f << "layout: post\n"
    f << "title: \"#{title.to_html(true)}\"\n"
    f << "---\n"
    f << "\n"
    f << "Add awesome content here.\n"
  end
end

desc 'Publish draft'
task :publish_draft, :title do |t, args|
  title = args[:title]
  filename = File.join(DRAFTS_DIR, "#{title.to_url}.md")

end

desc 'Create a new post'
task :new_post, :title do |t, args|
  title = args[:title] || 'New Post'
  timestamp = Time.now.strftime('%Y-%m-%d')
  filename = File.join(POSTS_DIR, "#{timestamp}-#{title.to_url}.md")

  puts "==> Creating new post: #{filename}"
  open(filename, 'w') do |f|
    f.write "---\n"
    f.write "layout: post\n"
    f.write "title: \"#{title.to_html(true)}\"\n"
    f.write "---\n"
    f.write "\n"
    f.write "Add awesome post content here.\n"
  end
end

desc 'Create a new page'
task :new_page, :title do |t, args|
  title = args[:title] || 'New Page'
  filename = File.join(title.to_url, 'index.md')

  puts "==> Creating new page: #{filename}"
  mkdir_p title.to_url
  open(filename, 'w') do |f|
    f.write "---\n"
    f.write "layout: page\n"
    f.write "title: \"#{title.to_html(true)}\"\n"
    f.write "---\n"
    f.write "\n"
    f.write "Add awesome page content here.\n"
  end
end

def git(*args)
  sh 'git', *args
end

# desc 'Deploy the site via Git'
# task :deploy => :build do
#   repo_url = `git config jekyll.deployurl`.chomp
#   if repo_url.empty?
#     abort 'error: set git repo url via `git config jekyll.deployurl` first'
#   end
#
#   if File.directory?(DEPLOY_DIR)
#     rm_rf Dir["#{DEPLOY_DIR}/*"]
#   else
#     mkdir_p DEPLOY_DIR
#   end
#
#   if File.directory?(File.join(DEPLOY_DIR, '.git'))
#     puts "==> Updating Git repository in #{DEPLOY_DIR} ..."
#     cd DEPLOY_DIR do
#       git 'fetch', '--prune'
#       git 'reset', '--hard', "origin/#{DEPLOY_BRANCH}"
#     end
#   else
#     puts "==> Cloning Git repository into #{DEPLOY_DIR} ..."
#     git 'clone', '--branch', DEPLOY_BRANCH, repo_url, DEPLOY_DIR
#   end
#
#   puts "==> Copying files from #{BUILD_DIR} to #{DEPLOY_DIR} ..."
#   cp_r Dir["#{BUILD_DIR}/*"], DEPLOY_DIR
#
#   cd DEPLOY_DIR do
#     puts '==> Pushing changes to remote Git repository...'
#     git 'add', '--all'
#     git 'commit', '--message', "Site updated at #{Time.now}"
#     git 'push', 'origin', DEPLOY_BRANCH
#   end
#
#   puts '==> Site successfully deployed.'
# end

task :default => :build
