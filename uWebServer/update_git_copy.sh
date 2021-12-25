git pull
# Not using Home Manager on my Server
#rm -rd ./home/
rm -rd ./system/
#cp -R ~/.config/nixpkgs/ ./home/
cp -R /etc/nixos/ ./system/
rm -rd ./system/users
git add .
git commit
git push
