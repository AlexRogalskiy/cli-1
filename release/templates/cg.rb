# This file is automatically generated by https://github.com/heroku/cli/blob/master/scripts/release/homebrew.js
# Do not update this file directly;
# Please update the template instead:
# https://github.com/heroku/cli/blob/master/scripts/release/homebrew/templates/heroku.rb
class Cg < Formula
  desc "Query your cloud and SaaS data with GraphQL"
  homepage "https://cloudgraph.dev"
  url "__CLI_DOWNLOAD_URL__"
  sha256 "__TARBALL_HASH__"

  def install
    inreplace "bin/cg", /^CLIENT_HOME=/, "export CG_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["**"]
    bin.install_symlink libexec/"bin/cg"

  #   bash_completion.install libexec/"node_modules/@heroku-cli/plugin-autocomplete/autocomplete/brew/bash" => "heroku"
  #   zsh_completion.install libexec/"node_modules/@heroku-cli/plugin-autocomplete/autocomplete/brew/zsh/_heroku"
  end

  # def caveats; <<~EOS
  #   To use the Heroku CLI's autocomplete --
  #     Via homebrew's shell completion:
  #       1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
  #           NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
  #                 and called, either explicitly or via a framework like oh-my-zsh.
  #       2) Then run
  #         $ heroku autocomplete --refresh-cache
  #     OR
  #     Use our standalone setup:
  #       1) Run and follow the install steps:
  #         $ heroku autocomplete
  # EOS
  # end
  # end 3

  test do
    system bin/"cg", "version"
  end
end
