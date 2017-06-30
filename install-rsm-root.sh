#!/bin/sh

set -e

gh_repo="arc-kde"
gh_desc="Arc KDE customization"

cat <<- EOF

  $gh_desc
  https://github.com/PapirusDevelopmentTeam/$gh_repo


EOF

temp_dir=$(mktemp -d)

echo "=> Getting the latest version from GitHub ..."
wget -O "/tmp/$gh_repo.tar.gz" \
  https://github.com/Jacobtey/$gh_repo/archive/master.tar.gz
echo "=> Unpacking archive ..."
tar -xzf "/tmp/$gh_repo.tar.gz" -C "$temp_dir"
echo "=> Deleting old $gh_desc ..."
sudo rm -f /usr/share/color-schemes/RSM.colors
sudo rm -f /usr/share/konsole/RSM.colorscheme
sudo rm -rf /usr/share/plasma/desktoptheme/RSM
sudo rm -rf /usr/share/plasma/look-and-feel/com.github.jacobtey.rsm
sudo rm -rf /usr/share/wallpapers/RSM
sudo rm -rf /usr/share/yakuake/skins/breeze-rsm-transparent
echo "=> Installing ..."
sudo cp --no-preserve=mode,ownership -r \
  "$temp_dir/$gh_repo-master/color-schemes" \
  "$temp_dir/$gh_repo-master/konsole" \
  "$temp_dir/$gh_repo-master/plasma" \
  "$temp_dir/$gh_repo-master/wallpapers" \
  /usr/share/
sudo mkdir -p /usr/share/yakuake/skins/
sudo cp --no-preserve=mode,ownership -r \
  "$temp_dir/$gh_repo-master/yakuake/kns_skins/rsm" \
  /usr/share/yakuake/skins/
echo "=> Clearing cache ..."
rm -rf "/tmp/$gh_repo.tar.gz" "$temp_dir" \
  ~/.cache/plasma-svgelements-RSM* \
  ~/.cache/plasma_theme_RSM*.kcache
echo "=> Done!"
