define :authorized_keys_for, :keys => "public-keys", :group => nil, :home => nil do

  user  = params[:name]
  group = params[:group] || user
  home  = params[:home]  || "/home/#{user}"
  keys  = data_bag params[:keys]

  if keys.any?
    ssh_public_keys = keys.map do |key|
      data_bag_item(params[:keys], key)
    end

    directory "#{home}/.ssh" do
      owner user
      group group
      mode 0700
      action :create
      only_if "test -d #{home}"
    end

    file "#{home}/.ssh/authorized_keys" do
      owner user
      group group
      content ssh_public_keys.collect{ |x| "#{x['key']} ##{x['id']}" }.join("\n")
    end
  end
end
