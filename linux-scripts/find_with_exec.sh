# find /var/lib/jenkins -name "*JENKINS*"  -type d -exec bash -c 'a="{}"; cd $a; rm -rf *JENKINS_*; ls' \; 
