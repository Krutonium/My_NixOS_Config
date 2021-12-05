rm -rd ./home/
rm -rd ./system/
cp -R ~/.config/nixpkgs/ ./home/
cp -R /etc/nixos/ ./system/
git add .
git commit
git push
