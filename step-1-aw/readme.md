# Set Up AdventureWorks Database

The AdventureWorks database is a sample SQL Server database built and maintained by Microsoft. Built under a relational model, the database is useful to learn the power of the SQL query.

## Download AdventureWorks 2017

1. Navigate to the [MS AdventureWorks Github](https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks) site.
2. Navigate to the portion of the site titled: *"AdventureWorks (OLTP) full database backups"*.
3. Click AdventureWorks2017.bak in order to download the back-up file.
4. Save (or copy/paste) the file to `C:/Program Files`.
    + This is important! SQL Server is very permissions-heavy for a reason, and placing it in a location like `C:/users/...` may result in an error when you go to restore the database.

## Restore AdventureWorks 2017

*If you are using a loaner laptop or virtual machine, **be sure to place the .bak file in your UC I:/ drive or OneDrive.** [This video]() shows you how to restore the database through a virtual machine.*

1. Open SSMS and press `Connect`.
    + You should not need to change any defaults.
2. In the Object Explorer, navigate to the `Databases` node and right-click. Select `Restore Database...`.

    <img src="img/aw-1.jpg" alt="Restore Database" width="400">
    
3. Select Device as the Source and click on the ellipses `...` button.

    <img src="img/aw-2.jpg" alt="Locate Device Source" width="600">
    
4. Click `Add`.
5. Navigate to `C:/Program Files/` and find the `AdventureWorks2017.bak` file. Add the file.
6. When returned to the main menu, select `OK`.
7. Within the Object Explorer, you should now see AdventureWorks2017 as a node under `Databases`.

    <img src="img/aw-3.jpg" alt="AdventureWorks Database Icon" width="250">
