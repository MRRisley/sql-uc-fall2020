# Setting up MS SQL Server

*Note: Mac users will need to use a PC/Windows. Lindner has loaner laptops as well as a Virtual Lab.*

## Install & start MS SQL Server Express 2017 for local PC.

**For Local PC:**
1. Go to next step if you're not using your own PC. 
2. [MS SQL Server **Express** Download Page](https://www.microsoft.com/en-us/sql-server/sql-server-editions-express)
3. Click "download now."
4. Run and follow [these steps](2017-install-steps.md) to complete set-up.
++ When prompted, select the Basic installation.,

**For UC Virtual Machine (VM) or Loaner Laptop** *(Mac Option)* **:**
1. If you're off-campus, you'll have to connect to UC's VPN first.
2. Connect to the Lindner Virtual lab through VM Horizon.
3. SQL Server is installed on the VM. Feel free to use the most recent version if multiple versions are installed.
4. Use your I:/ drive or OneDrive!

## Download and install AdventureWorks

[*AdventureWorks GitHub*](https://github.com/Microsoft/sql-server-samples/blob/master/samples/databases/adventure-works/README.md)

We will **install from a backup**!!! There are multiple options.

1. *Use AdventureWorks 2014.* It is important to ensure that the AdventureWorks version is compatible with the version of SQL Server. The year of AdventureWorks must be less than or equal to the year of SQL Server. No one should run a SQL Server version prior to 2014, so this shouldn't be an issue. AdventureWorks 2014 will work just fine with SQL Server 2017.
