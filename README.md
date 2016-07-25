# ZimbraMigration
Scripts to ease a migration from Zimbra 6.X to 8.X on a new server.

Those two scripts help to process all accounts at once for the tasks needed when migrating Zimbra accounts to a new server.

Remember to run as the user zimbra (su - zimbra).

## Warning!
Those scripts do NOT check anything. Use at your own risk! Read them and understand them before running them blindly on your system.

## deleteChildAccounts.sh
Removes child accounts from all your Zimbra accounts, as this functionnality is no longer supported in the latest versions of Zimbra. It lists all accounts and their child accounts so you can find another way to deal with it. The script takes no argument.

Usage: ./deleteChildAccounts.sh

## bulkUpdateLmtp.sh
When migrating accounts to a new Zimbra installation, remember to update the accounts' LMTP setting or the mails won't be delivered. This script takes the old server as the first argument, and the new server as the second.

Usage: ./bulkUpdateLmtp.sh OldServer NewServer
