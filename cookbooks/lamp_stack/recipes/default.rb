#
# Cookbook:: lamp_stack
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

execute 'update-upgrade' do
    command 'sudo apt-get update'
    action :run
end
