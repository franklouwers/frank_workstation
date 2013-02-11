# FIXME: This should be re-factored once package.rb has a mechanism
# for installing pkg files without mounting a dmg

app_path="/usr/bin/mosh"

ruby_block "Install mosh" do
  block do
    system("cd #{Chef::Config[:file_cache_path]}/ && curl -OL https://github.com/downloads/keithw/mosh/mosh-1.2.1.pkg")
    system("installer -allowUntrusted -package  #{Chef::Config[:file_cache_path]}/mosh-1.2.1.pkg -target /")
  end
  not_if {File.exists?(app_path)}
end

ruby_block "test that mosh install worked" do
  block do
    raise "mosh install failed!" if ! File.exists?(app_path)
  end
end
