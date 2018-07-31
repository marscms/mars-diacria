dependencies = [
  { DRY_STRUCT_VERSION: "0.1.0" },
  { DRY_STRUCT_VERSION: "0.1.1" },
  { DRY_STRUCT_VERSION: "0.2.0" },
  { DRY_STRUCT_VERSION: "0.2.1" },
  { DRY_STRUCT_VERSION: "0.3.0" },
  { DRY_STRUCT_VERSION: "0.3.1" },
  { DRY_STRUCT_VERSION: "0.4.0" },
  { DRY_STRUCT_VERSION: "0.5.0" }
]

task :test do
  require "digest"

  FileUtils.mkdir_p("gemfiles")
  template = File.read("templates/Gemfile.template")

  dependencies.each do |deps|
    hexdigest = Digest::SHA1.hexdigest(deps.to_s)
    path = "gemfiles/Gemfile-#{hexdigest}"

    unless File.exist?(path)
      content = template
                  .gsub("[GEMFILE_PATH]", '".."')
                  .gsub("[DRY_STRUCT_VERSION]", "\"#{deps[:DRY_STRUCT_VERSION]}\"")

      File.open(path, "w") { |file| file.write(content) }
    end

    unless File.exist?("#{path}.lock")
      sh "BUNDLE_GEMFILE=gemfiles/Gemfile-#{hexdigest} bundle"
    end

    sh "BUNDLE_GEMFILE=gemfiles/Gemfile-#{hexdigest} bundle exec rspec spec/"
  end
end
