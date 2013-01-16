NODOTFILES = %w(. .. .git .gitmodules README.md Rakefile LS_COLORS vim).freeze

class Dotfile
  def name
    @name
  end

  def initialize(name)
    @name = name
    @dotdir = `pwd`.chomp
  end

  def dest_file
    "#{ENV['HOME']}/.#{name}"
  end

  def backup
    if File.symlink?(dest_file)
      File.unlink dest_file
    else
      File.rename( dest_file, dest_file+".bak" ) if File.exists?(dest_file)
    end
  end

  def link
    File.symlink( full_name, dest_file)
  end

  def unlink
    File.unlink(dest_file) if File.symlink?(dest_file)
  end

  def full_name
    [@dotdir, name].join("/")
  end
end

task :undotify do
  files = Dir.glob(".*") - %w(. .. .git .gitmodules)
  files.each do |file|
    File.rename file, file[1..-1]
  end
end

task :unlink do
  files = Dir.glob("*")
  files.each do |file|
    dotfile = Dotfile.new(file)
    dotfile.unlink
  end
end

task :link do
  dotfiles.each do |file|
    dotfile = Dotfile.new(file)
    dotfile.backup
    dotfile.link
  end
end

task :test do
  puts "home: " +   ENV['HOME']
  vim = Dotfile.new("vim")
end

def dotfiles
  Dir.glob("*") - NODOTFILES
end

