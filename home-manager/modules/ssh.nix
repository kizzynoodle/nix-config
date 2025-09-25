# ssh.nix
# SSH remote file system mounting
{ user, ... }:
{
  fileSystems."/mnt" = {
    device = "ubuntu@13.216.228.43:/";
    fsType = "sshfs";
    options = [
      "nodev"
      "noatime"
      "allow_other"
      # "IdentityFile=/root/.ssh/id_ed25519"
      "IdentityFile=/home/${user}/Workshop/UTAD/2025/DistributedSystems/labuser.pem"
    ];
  };
}
