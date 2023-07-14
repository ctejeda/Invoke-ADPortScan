This Module scans the required ports in AD.

According to this Microsoft Article, several ports must be available for specific funtions in AD

https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd772723(v=ws.10)


# Invoke-ADPortScan

This is a PowerShell script that scans and tests connectivity to several Active Directory related ports on a specific host. It creates a CSV file `ADPorts.csv` in the temp folder `C:\temp` and provides the status of each port whether it's open or not.

The script also includes a function named `Invoke-ADPortScan` which takes a hostname as an input and performs the port scan operation on the host.

## Prerequisites

Make sure you have the `NetTCPIP` PowerShell module installed in your system as this script imports it.

## Usage

Follow the steps below to execute the script:

1. Open PowerShell console. You can do this by searching for 'powershell' in the Windows search bar and clicking on 'Windows PowerShell'.
   
2. Navigate to the directory where the script resides using the `cd` command. For example, if your script is in `C:\Scripts`, you would type `cd C:\Scripts`.

3. Run the function by calling it:

   ```powershell
   Invoke-ADPortScan
   ```

4. When prompted, enter the hostname of the machine you wish to scan and hit enter. The script will then perform the port scan and generate a CSV report.

## Output

The script will create a CSV file named `ADPorts.csv` in the directory `C:\temp`. If this directory does not exist, please create it manually before running the script. The CSV file contains the following information:

- `Hostname`: The hostname of the machine that was scanned.
- `Port`: The port that was scanned.
- `Port Usage`: The usage of the scanned port.
- `Traffic Type`: The type of traffic that the port supports.
- `Port Is Open`: A Boolean value indicating whether the port is open or not.

## Note

The script is designed to run on a Windows machine and may not function as expected in other environments. It is also intended to be used in a testing or sandbox environment and should be used responsibly.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
