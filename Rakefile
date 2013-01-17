class Dotfile

  @@dotdir   ||= File.expand_path( "..", __FILE__ )
  @@dotfiles ||= FileList["*"] - %w(. .. .git .gitmodules README.md Rakefile LS_COLORS vim Gemfile Gemfile.lock)

  def initialize(name)
    @name = name
  end

  def homedir
    ENV['HOME']
  end

  def dest_file
    @dest_file ||= "#{homedir}/.#{@name}"
  end

  def backup
    File.rename( dest_file, dest_file + ".bak" ) if File.exists?(dest_file)
    self
  end

  def link
    puts "Linking #{dest_file}..."
    File.symlink( full_name, dest_file )
    self
  end

  def unlink
    puts "Unlinking #{dest_file}..."
    if File.symlink?(dest_file)
      File.unlink(dest_file)
    else
      backup
    end
    self
  end

  def full_name
    @full_name ||= [@@dotdir, @name].join("/")
  end

  def self.each(&block)
    @@dotfiles.each(&block)
  end
end

desc "Unlink dotfiles from home directory"
task :unlink do
  Dotfile.each { |file| Dotfile.new(file).unlink }
end

desc "Link dotfiles to home directory"
task :link do
  Dotfile.each { |file| Dotfile.new(file).backup.link }
end


