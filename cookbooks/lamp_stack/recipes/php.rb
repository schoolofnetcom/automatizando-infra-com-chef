package 'php' do
    action :install
end

package 'php-pear' do
    action :install
end

package 'php-mysql' do
    action :install
end

cookbook_file '/etc/php/7.0/cli/php.ini' do
    source 'php.ini'
    mode '0644'
    action :create
    notifies :restart, "service[apache2]"
end

execute 'chownlog' do
    command 'chown -R www-data /var/log/php'
    action :nothing
end

directory '/var/log/php' do
    action :create
    notifies :run, "execute[chownlog]"
end




