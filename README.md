<h1>File Integrity Monitor</h1>


<h2>Description</h2>
Created a simple File Integrity Monitor from scratch using PowerShell. The intent is to showcase my skills in powershell combined with the integrity portion of the CIA traid. A very simple project hoping to demonstrate my understanding in Integrity and how it can be used in Information Security to safeguard information. Exposure to PowerShell, Hashing Algorithms (SHA-512) and some Automation. 

<br />


<h2>File Integrity Monitor Tool</h2>

- <b>The tool helps to improve security by detecting any unauthorized changes to files and directories. This helps to prevent data breaches and other security incidents.</b> 


<h2>Compliance</h2>

- <b>The tool can help organizations to comply with regulatory requirements by ensuring that all changes made to files and directories are logged and audited.</b>


<p align="center">
Flow Chart: <br/>
<img src="https://i.imgur.com/ZmKNd7b.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />

  
<h3>In this step, I created the two options to either collect the data from the existing baseline file or calculate the hash and create new baseline data</h3>
<p align="center">
<br/>
<img src="https://i.imgur.com/By7hqeZ.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
  

<h3>This is how the path and Hash would look like after collecting new Baseline data(option A)</h3>
<p align="center">
<br/>
<img src="https://i.imgur.com/ytIa0lh.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
  
 
<h3>This part of the script was very important, the intent was to append any repated data within the baseline by using the "Test-Path -Path"</h3>
<p align="center">
<br/>
<img src="https://i.imgur.com/mgdcxih.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
    
    
  
<h3>This section allows to load the file|hash from baseline.txt file and store them in a dictionary form, I run just this part of the script to test the view</h3>
<p align="center">
<br/>
<img src="https://i.imgur.com/eNMHYJe.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
      
      
     
<h3>The script with the intent to check continuosly for files in the saved Baseline (every second)</h3>
<p align="center">
<br/>
<img src="https://i.imgur.com/9hhRHJT.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
        
        
       
<h3>Not the best screenshot I took, but here you can see the script calculating the hash -> if I create a new file (in this case "e") if $hash.path do not match the current baseline then write-host "A new document has been created" </h3>
<p align="center">
<br/>
<img src="https://i.imgur.com/R9TbqEX.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
          
          
          
<h3>Here I made a script calculating the changes to any file in the current baseline file, if hash.path -eq hash.path ELSE write-host "$hash.path" has been changed" after I just added a letter to the file.  </h3>
<p align="center">
<br/>
<img src="https://i.imgur.com/InBEErD.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
            
            
          
<h3>Copied similar string set for the change in the baseline as for a new File Created. If the new file is "null" meaning not in the baseline then it triggers the message.</h3>
<p align="center">
<br/>
<img src="https://i.imgur.com/80OzQa0.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
  
