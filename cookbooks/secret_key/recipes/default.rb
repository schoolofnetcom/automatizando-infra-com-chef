#
# Cookbook:: secret_key
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

cookbook_file '/etc/chef/encrypted_data_bag_secret' do
    source 'encrypted_data_bag_secret'
    action :create
  end
