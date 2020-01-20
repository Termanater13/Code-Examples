ARGMODE="CHECK"
RSAUPASS="FALSE"
for arg in "$@"
do
	case $ARGMODE in
		CHECK)
			case $arg in
				-u | --username)
				ARGMODE="USERNAME"
				;;
				-p | --userpass | --userpassword)
				ARGMODE="USERPASS"
				;;
				-r | --rootpass | --rootpassword)
				ARGMODE="ROOTPASS"
				;;
				-vm)
				VMINSTALL="TRUE"
				;;
                -nvm)
                VMINSTALL="FALSE"
                ;;
				-h | --help | *)
				echo "This Script is for automating the install of arch linux"
				echo "-u\t--username\n\tSet the user name of the users account"
				echo "-p\t--userpass\t--userpassword\n\tSet the user password of the users account"
				echo "-r\t--rootpass\t--rootpassword\n\tSet the root user's password"
				echo "-vm\n\tThis is for when instaling to a virtual machine as some items are not needed since host machene takes care of them"
				echo "-rsau\n\tSet Root user password to be the same as user\n\tNOTE: This is not recomended as this could be a security risk"
				echo "-h\t--help\n\tshow this text"
				exit 0
				;;
			esac
			;;
		USERNAME)
			USERNAME=$arg
            ARGMODE="CHECK"
			;;
		USERPASS)
			USERPASS=$arg
            ARGMODE="CHECK"
			;;
		ROOTPASS)
			ROOTPASS=$arg
            ARGMODE="CHECK"
			;;
	esac
done

##### This gorup allows parsing of arguments of any length groupings. this 
# allows anything from 1 to many but large groups would lead to hard to maintain
# Code. "ARGMODE" is the key componit in this code as it allows the inital case
# to check to see what it should do with the current argument, and changing its
# value will affect the following argument so it can be stored in a way that
# future code can process it later.