mysqlpass = data_bag_item("mysql", "rtpass.json")

mysql_service "mysqldefault" do
  version '5.7'
  initial_root_password mysqlpass["password"]
  action [:create, :start]
end    