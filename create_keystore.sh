if [[ ${PWD:0:7} = "/media/" ]]; then
	keytool -genkey -v -keystore my-key.keystore -keyalg RSA -keysize 2048 -validity 10000

	echo "Make sure to move your keystore file to your secure storage"
	echo "Make sure to (manually) create a textfile called alias.txt, ks-pass.txt and key-pass.txt with your password on your secure storage"
	echo "!!!Make sure you have multiple copies of these files on various secure devices!!!"
else
	echo "Run this script directly on your USB device"
fi
