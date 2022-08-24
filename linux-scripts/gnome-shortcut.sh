cat<<eof | sudo tee /usr/share/applications/intellij.desktop
[Desktop Entry]
Type=Application
Terminal=false
Icon[en_US]=/home/$USER/dev-tools/idea/bin/idea.png
Name[en_US]=IntelliJ
Exec=/home/$USER/dev-tools/idea/bin/idea
Name=IntelliJ Idea
Icon=/home/$USER/dev-tools/idea/bin/idea.png
StartupWMClass=jetbrains-idea
eof

sudo chmod 644 /usr/share/applications/intellij.desktop
sudo chown root:root /usr/share/applications/intellij.desktop

cat<<eof | sudo tee /usr/share/applications/webstorm.desktop
[Desktop Entry]
Type=Application
Terminal=false
Icon[en_US]=/home/$USER/dev-tools/webstorm/bin/webstorm.png
Name[en_US]=Webstorm
Exec=/home/$USER/dev-tools/webstorm/bin/webstorm
Name=Webstorm
Icon=/home/$USER/dev-tools/webstorm/bin/webstorm.png
StartupWMClass=jetbrains-webstorm
eof

sudo chmod 644 /usr/share/applications/webstorm.desktop
sudo chown root:root /usr/share/applications/webstorm.desktop