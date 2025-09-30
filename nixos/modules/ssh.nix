# ssh.nix
# SSH remote file system mounting
{ user, ... }:
let
  DSDir = "/home/${user}/Workspace/UTAD/2025/DistributedSystems";
in
{
  # fileSystems."${DSDir}/Server1" = {
  #   #fileSystems."/mnt" = {
  #   device = "ubuntu@13.216.228.43:/home/ubuntu/";
  #   #device = "ubuntu@ec2-13-216-228-43.compute-1.amazonaws.com:/";
  #   fsType = "sshfs";
  #   options = [
  #     #"nodev"
  #     #"noatime"
  #     # "IdentityFile=/root/.ssh/id_ed25519"
  #     "IdentityFile=${DSDir}/vockey.pem"
  #     "allow_other"
  #     "x-systemd.automount"
  #   ];
  # };
}
