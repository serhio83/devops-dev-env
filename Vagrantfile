Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
      vb.gui = true
    #   # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  config.vm.network "private_network", ip: "10.10.10.5"

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
  end

end
