disk = 'zfs_disk.vdi'
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |vb|
    #   # Display the VirtualBox GUI when booting the machine
      vb.gui = false
    #   # Customize the amount of memory on the VM:
    vb.memory = "3072"
    vb.customize ['createhd', '--filename', disk, '--size', 20 * 1024]
    vb.customize ['storageattach', :id, '--storagectl', 'SCSI', '--port', 5, '--device', 0, '--type', 'hdd', '--medium', disk]

  end

  config.vm.network "private_network", ip: "10.10.10.5"

  config.vm.provision "shell" do |s|
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    s.inline = <<-SHELL
      echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
    SHELL
  end

end
