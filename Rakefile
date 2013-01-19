class Dotfile
  DOTIGNORE = '.dotignore'

  @@dotdir   ||= File.expand_path( "..", __FILE__ )
  @@dotignore ||= %w[ .git .gitmodules ]
  if File.exists?(DOTIGNORE)
    @@dotignore += File.read(DOTIGNORE).split("\n")
  end

  @@dotfiles ||= FileList["*"] - @@dotignore

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
    if File.symlink?(dest_file)
      File.unlink(dest_file)
    else
      File.rename( dest_file, dest_file + ".bak" ) if File.exists?(dest_file)
    end
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

desc "List currently managed dotfiles"
task :list do
  Dotfile.each {|f| puts f }
end

desc "Update submodules"
task :submodules => [:mod_ls_colors,:mod_pathogen,:mod_zprezto]

task :mod_ls_colors do
  system "curl -So dircolors \
    https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS"
end

task :mod_pathogen do
  system "curl -So vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim"
end

task :mod_zprezto do
  unless File.exists?('zprezto')
    system "git clone --recursive https://github.com/sorin-ionescu/prezto.git \
      zprezto"
  end
end

desc "Install/Remove vim bundles"
task :vim_install do
  system "/usr/bin/env vim-update-bundles -n"
end

desc "Update vim bundles"
task :vim_update do
  system "/usr/bin/env vim-update-bundles"
end

task :script do
  File.open('install.sh','w') do |script|
    Dotfile.each do |f|
      script.puts %Q(ln -s `pwd`/#{f} $HOME/.#{f})
    end
  end
end
