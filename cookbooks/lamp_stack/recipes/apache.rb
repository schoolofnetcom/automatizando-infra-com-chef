
package 'apache2' do
    action :install
end

service 'apache2' do
    action [:enable, :start]
end

node["lamp_stack"]["sites"].each do |sitename, data|
    document_root = "/var/www/html/#{sitename}"

    directory document_root do
        mode '0755'
        recursive true
    end

    directory "/var/www/html/#{sitename}/public_html" do
        mode '0755'
        action :create
    end

    directory "/var/www/html/#{sitename}/logs" do
        mode '0755'
        action :create
    end
    
    execute "enable-sites" do
      command "a2ensite #{sitename}"
      action :nothing
    end  

    template "/etc/apache2/sites-available/#{sitename}.conf" do
       source 'virtualhosts.erb'
       mode '0644'
       variables(
           :document_root => document_root,
           :port => data["port"],
           :serveradmin => data["serveradmin"],
           :servername => data["servername"]
       )   
       notifies :run, "execute[enable-sites]"
       notifies :restart, "service[apache2]"  
    end       
end
