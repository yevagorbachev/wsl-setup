## WSL Installation
1. `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
2. `Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform`
3. Execute `program-setup/auxiliary-files/wsl_update_x64.msi`
4. Install Ubuntu 20.04 LTS from the Windows Store

### Basic setup
1. Clone this repository to `~/` (HTTPS)
2. `sh ~/wsl-setup/init.sh`
4. `sh program-setup/ssh-setup.sh SEED GITHUB-EMAIL GITHUB-NAME` 
3. Vim `:PlugStats` and `:PlugInstall`
