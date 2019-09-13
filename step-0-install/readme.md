# Setting up MS SQL Server

*Note: Mac users will need to use a PC/Windows. Lindner has loaner laptops as well as a Virtual Lab.*

## Install/Run MS SQL Server Express 2017 & SSMS 18.2

**For Local PC:**
1. Go to next step if you're not using your own PC. 
2. [MS SQL Server **Express** Download Page](https://www.microsoft.com/en-us/sql-server/sql-server-editions-express)
3. Click "download now."
4. Run and follow these steps:
    + When prompted, select the Basic installation.
    + *Restart may be required.*
    + At end of installation, select "Install SMSS" **OR** [go here](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?redirectedfrom=MSDN&view=sql-server-2017) to download.
5. Install SMSS.
    + *Restart may be required.*
6. Navigate to the SSMS 18 App. `Start -> Microsoft SQL Server Tools 18 -> SQL Server Management Studio 18`
7. Press connect if you see a similar image below. *Your server name will differ*. Get with me if you can't press connect.

         ![SSMS Connect Window](../img/ssms-connect.jpg)

**For UC Virtual Machine (VM) or Loaner Laptop** *(Mac Option)* **:**
1. If you're off-campus, you'll have to connect to UC's VPN first.
2. Connect to the Lindner Virtual lab through VM Horizon. 
    + *You have to download and set it up on your machine first if you haven't already. Link [for Windows](https://kb.uc.edu/KBArticles/UCVLabs-Windows.aspx) or [for Mac](https://kb.uc.edu/KBArticles/UCVLabs-MacOSX.aspx).*
3. SQL Server is installed on the VM. Feel free to use the most recent version if multiple versions are installed.
4. Use your I:/ drive or OneDrive!




## Download and install AdventureWorks

[*AdventureWorks GitHub*](https://github.com/Microsoft/sql-server-samples/blob/master/samples/databases/adventure-works/README.md)

We will **install from a backup**!!! There are multiple options.

1. *Use AdventureWorks 2014.* It is important to ensure that the AdventureWorks version is compatible with the version of SQL Server. The year of AdventureWorks must be less than or equal to the year of SQL Server. No one should run a SQL Server version prior to 2014, so this shouldn't be an issue. AdventureWorks 2014 will work just fine with SQL Server 2017.
