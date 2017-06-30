#!/bin/sh

set -e

gh_repo="rsm"
gh_desc="RSM customization"

cat <<- EOF


  $gh_desc
  https://github.com/Jacobtey/$gh_repo


EOF

temp_dir=$(mktemp -d)

echo "=> Getting the latest version from GitHub ..."
wget -O "/tmp/$gh_repo.tar.gz" \
  https://github.com/Jacobtey/$gh_repo/archive/master.tar.gz
echo "=> Unpacking archive ..."
tar -xzf "/tmp/$gh_repo.tar.gz" -C "$temp_dir"
echo "=> Deleting old $gh_desc ..."
rm -f ~/.local/share/color-schemes/RSM.colors
rm -f ~/.local/share/konsole/RSM.colorscheme
rm -rf ~/.local/share/plasma/desktoptheme/RSM
rm -rf ~/.local/share/plasma/look-and-feel/com.github.jacobtey.rsm
rm -rf ~/.local/share/wallpapers/RSM
rm -rf ~/.local/share/yakuake/kns_skins/rsm
echo "=> Installing ..."
mkdir -p ~/.local/share
cp --no-preserve=mode,ownership -r \
  "$temp_dir/$gh_repo-master/color-schemes" \
  "$temp_dir/$gh_repo-master/konsole" \
  "$temp_dir/$gh_repo-master/plasma" \
  "$temp_dir/$gh_repo-master/wallpapers" \
  "$temp_dir/$gh_repo-master/yakuake" \
  ~/.local/share/
echo "=> Clearing cache ..."
rm -rf "/tmp/$gh_repo.tar.gz" "$temp_dir" \
  ~/.cache/plasma-svgelements-RSM* \
  ~/.cache/plasma_theme_RSM*.kcache
echo "=> Done!"
