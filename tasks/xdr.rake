namespace :xdr do

  # As Hayashi adds more .x files, we'll need to update this array
  # Prior to launch, we should be separating our .x files into a separate
  # repo, and should be able to improve this integration.
  HAYASHI_XDR = [
    "src/xdr/Payshares-ledger-entries.x",
    "src/xdr/Payshares-ledger.x",
    "src/xdr/Payshares-overlay.x",
    "src/xdr/Payshares-transaction.x",
    "src/xdr/Payshares-types.x",
    "src/overlay/PaysharesXDR.x",
    "src/scp/SCPXDR.x",
  ]

  task :update => [:download, :generate]

  task :download do
    require 'octokit'
    require 'base64'
    
    client = Octokit::Client.new(:netrc => true)

    HAYASHI_XDR.each do |src|
      local_path = "xdr/" + File.basename(src)
      encoded    = client.contents("payshares/payshares-core", path: src).content
      decoded    = Base64.decode64 encoded

      IO.write(local_path, decoded)
    end
  end

  task :generate do
    require "pathname"
    require "xdrgen"
    require 'fileutils'
    FileUtils.rm_rf "generated"

    paths = Pathname.glob("xdr/**/*.x")
    compilation = Xdrgen::Compilation.new(
      paths, 
      output_dir: "generated", 
      namespace:  "payshares-base-generated",
      language:   :ruby
    )
    compilation.compile
  end
end