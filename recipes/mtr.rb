include_recipe "pivotal_workstation::homebrew"

brew_install "mtr"

ruby_block "Fix mtr permissions" do
  block do
    sbinfile = `brew list mtr | grep sbin`.strip
    File.chmod(04755, sbinfile)
    File.chown(0,0, sbinfile)
  end
end