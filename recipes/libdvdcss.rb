# FIXME: This should be re-factored once package.rb has a mechanism
# for installing pkg files without mounting a dmg

app_path="/usr/lib/libdvdcss.2.dylib"

ruby_block "Install libdvdcss" do
  block do
    system("cd #{Chef::Config[:file_cache_path]}/ && curl -OL http://download.videolan.org/libdvdcss/last/macosx/libdvdcss.pkg")
    system("installer -allowUntrusted -package  #{Chef::Config[:file_cache_path]}/libdvdcss.pkg -target /")
  end
  not_if {File.exists?(app_path)}
end

ruby_block "test that libdvdcss install worked" do
  block do
    raise "libdvdcss install failed!" if ! File.exists?(app_path)
  end
end
