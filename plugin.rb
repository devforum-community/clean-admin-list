# name: clean-admin-list
# version: 1.0.1
# authors: buildthomas

after_initialize do

  add_to_serializer(:about, :admins) do
    admin_list_filter_suffix = SiteSetting.admin_list_filter_suffix
    
    # hide emails that do not match setting value (will do nothing if setting == '')
    object.admins.select { |u| u.email.match(/#{Regexp.escape(admin_list_filter_suffix)}/i) }
  end
  
  add_to_serializer(:user, :email) do
    object.email + " TEST"
  end

end
