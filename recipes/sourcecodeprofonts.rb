fontfile="#{WS_HOME}/Library/Fonts/SourceCodePro-Regular.otf"

ruby_block "Install SourceCodePro Fonts" do
  block do
    system("cd #{Chef::Config[:file_cache_path]}/ && curl -OL http://ignum.dl.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip")
    system("cd #{Chef::Config[:file_cache_path]}/ && unzip SourceCodePro_FontsOnly-1.017.zip")
    system("cd #{Chef::Config[:file_cache_path]}/ && cp -a SourceCodePro_FontsOnly-1.017/OTF/*otf #{WS_HOME}/Library/Fonts/")
  end
  not_if {File.exists?(fontfile)}
end

ruby_block "test that SourceCodePro fonts are installed" do
  block do
    raise "libSourceCodePro font install failed!" if ! File.exists?(fontfile)
  end
end
