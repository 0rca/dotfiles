
task :undotify do
  files = Dir.glob(".*") - %w(. .. .git .gitmodules)
  files.each do |file|
    # File.rename file, file[1,-1]
    File.rename file, file[1..-1]
  end
end
