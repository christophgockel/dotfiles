#!/usr/bin/env ruby
# source: http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen/

git_bundles = [
  "https://github.com/kien/ctrlp.vim.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/guns/vim-clojure-static.git",
  "https://github.com/kchmck/vim-coffee-script.git",
  "https://github.com/tpope/vim-endwise.git",
  "https://github.com/fatih/vim-go.git",
  "https://github.com/thoughtbot/vim-rspec.git",
  "https://github.com/chriskempson/base16-vim.git",
  "https://github.com/elixir-lang/vim-elixir.git"
]

#vim_org_scripts = [
#  ["IndexedSearch", "7062",  "plugin"],
#  ["jquery",        "12107", "syntax"],
#]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(ENV["HOME"], ".vim", "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

#vim_org_scripts.each do |name, script_id, script_type|
#  puts "downloading #{name}"
#  local_file = File.join(name, script_type, "#{name}.vim")
#  FileUtils.mkdir_p(File.dirname(local_file))
#  File.open(local_file, "w") do |file|
#    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
#  end
#end
