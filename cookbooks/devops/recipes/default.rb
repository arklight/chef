# --- install packages we need ---
package 'ntp'
package 'sysstat'
package 'apache2'

# --- add the data partition ---
directory '/mnt/data_bank'

mount '/mnt/data_bank' do
    action [:mount, :enable] # mount and add to fstab
    device 'data_bank'
    device_type :label
    options 'noatime,errors=remount-ro'
end

# -- set hostname ---
# note how this is plain ruby code, so we can define variables to
# DRY up our code:
hostname = 'chef-test'

file '/etc/hostname' do
  content "#{hostname}\n"
end

service 'hostname' do
  action :restart
end

file '/etc/hosts' do
  content "127.0.0.1 localhost #{hostname}\n"
end

# --- Deploy a configuration file ---
# For longer files, when using 'content "..."' becomes too
# cumbersome, we can resort to deploying separate files:
cookbook_file '/etc/apache2/apache2.conf'
# This will copy cookbooks/op/files/default/apache2.conf (which
# you'll have to create yourself) into place. Whenever you edit
# that file, simply run "./deploy.sh" to copy it to the server.

service 'apache2' do
  action :restart
end