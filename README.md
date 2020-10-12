# fedora_post_install

A shell script for enabling RPMFusion repositories, installing multimedia codecs and enabling flatpak on Fedora.

Usage:
1. Open Terminal application. Then copy and paste each of the following commands in the terminal one by one.                   

2. Download the script:       
```
wget https://raw.githubusercontent.com/siddlv/fedora_post_install/main/fedorapostinstall.sh
```

3. Give permission to execute:    
```
chmod +x fedorapostinstall.sh
```

4. Run the script:
```
./fedorapostinstall.sh
```

On successful completion, the script will display 'Success!'. It will also delete the downloaded script and exit terminal.

If it says 'ERROR', run the script again.

References:  
https://rpmfusion.org/Configuration 
https://flatpak.org/setup/Fedora
