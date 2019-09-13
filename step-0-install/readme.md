# Install/Run MS SQL Server Express 2017 & SSMS 18.2

*Note: Mac users will need to use a PC/Windows. Lindner has loaner laptops as well as a Virtual Lab. See Option 2 below.*

## Option 1: Local PC

*Recommended if you own a Windows machine.*

1. *Go to next step if you're not using your own PC.*
2. Download [MS SQL Server **Express** 2017](https://www.microsoft.com/en-us/sql-server/sql-server-editions-express)
    + Click "download now."
3. Run and follow these steps:
    + When prompted, select the Basic installation.
    + *Restart may be required.*
    + At end of installation, select "Install SMSS" **OR** [go here](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?redirectedfrom=MSDN&view=sql-server-2017) to download.
4. Run SMSS Installation from Step 3.
    + *Restart may be required.*
5. Navigate to the SSMS 18 Application. `Start -> Microsoft SQL Server Tools 18 -> SQL Server Management Studio 18`
6. Press connect if you see a similar image below. *Your server name will differ*. Get with me if you can't press connect.

    <img src="img/ssms-connect.jpg" alt="SSMS Connect Window" width="400"/>
 
7. You're in! Congratulations!

## Option 2: UC Virtual Machine (VM) or Loaner Laptop *(Mac Option)*
1. If you're off-campus, you'll have to connect to UC's VPN first.
    + *[Instructions](https://kb.uc.edu/KBArticles/VPN-InstallandUse.aspx).
2. Connect to the Lindner Virtual lab through VM Horizon. 
    + *You have to download and set it up on your machine first if you haven't already. Link [for Windows](https://kb.uc.edu/KBArticles/UCVLabs-Windows.aspx) or [for Mac](https://kb.uc.edu/KBArticles/UCVLabs-MacOSX.aspx).*
    + *ucvlabs.uc.edu is the connection server. It's embedded in the instructions.*
3. SQL Server is installed on the VM. Feel free to use the most recent version if multiple versions are installed.
4. You're in! Congratulations!

## Download and install AdventureWorks

[*AdventureWorks GitHub*](https://github.com/Microsoft/sql-server-samples/blob/master/samples/databases/adventure-works/README.md)

We will **install from a backup**!!! There are multiple options.

1. *Use AdventureWorks 2014.* It is important to ensure that the AdventureWorks version is compatible with the version of SQL Server. The year of AdventureWorks must be less than or equal to the year of SQL Server. No one should run a SQL Server version prior to 2014, so this shouldn't be an issue. AdventureWorks 2014 will work just fine with SQL Server 2017.
