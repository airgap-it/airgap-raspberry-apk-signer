# airgap-raspberry-apk-signer
Modified Raspberry Pi image to sign your Android APK the most secure way (airgapped).

## Idea / Motivation
During the development process of AirGap, we came to the conlusion that probably a lot of devices will receive the app through alternative channels such as sideloading or sending the file through QR codes to the airgapped device. As this process requires the phone to be configured to allow installtions from unknown sources, it's crucial to make sure that the user does not install a malicious application. Android prevents this through application signatures. If the application was installed once, it will fail if the user tries to update the application with a newer version but signed by a different developer. This is fine, as long as the developer can guarantee that his signing certificate has never been compromised.

As our team has a strong focus on security, we knew this signing step can only be safe, if it's done properly. We also knew, the only way to achieve the highest level of security is if we airgap this step as well.

## Solution

### Requirements

* Raspberry Pi3
* Two USB Sticks, one of them with Hardware encryption (we use an iStorage datashur - https://istorage-uk.com/product/datashur/)
* This Raspberry distribution

### Setup

Write the attached image to your SD Card (i.e with Etcher - https://etcher.io) or using the terminal: https://computers.tutsplus.com/articles/how-to-clone-raspberry-pi-sd-cards-using-the-command-line-in-os-x--mac-59911

## Usage

### Generate keystore

1. Attach a monitor and a keyboard to your Raspberry. 
2. Wait until all signing attempts (100) passed.
3. Login with the user pi (password raspberry)
4. Copy the file .create_keystore.sh to your encrypted usb drive
3. Run the script
4. Create the following files on your encrypted usb drive:
	- alias.txt (containing your alias)
	- ks-pass.txt (containing keystore password)
	- key-pass.txt (containing your key alias password)
5. Done

### Sign an APK

As soon as you have your keystore on the secure USB storage, signing an APK is easy, **no keyboard or monitor is required**.

1. Boot the Raspberry
2. Connect both of your USB sticks to the Raspberry
3. Wait a few minutes, usually the indicators on the USB will stop blinking.
4. Done, if the Raspberry lights are not blinking anymore.

It will automatically find the apk and your key, no interaction required. A file called android-release.apk will be written to the same folder where the apk file was found.

## About
We use a base raspbian image, with additional installed android sdk signing tools. Beside the create_keystore.sh file, we also adjusted the rc.local (bootup) file to automatically sign without the need of a monitor attached.

## Remarks

* Only use the SD card for this single purpose
* If you are super paranoid (like we are), only use the Raspberry for this single purpose
* Even though we disabled all networking (ethernet, bluetooth, wifi) best practive is to not connect an ethernet cable to the device.
* **Make sure that you always create a backup of your keystore file. If the file is lost, you are not longer able to sign and therefore provide updates for your existing applications!**
