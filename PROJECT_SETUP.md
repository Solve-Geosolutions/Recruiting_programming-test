<!-- ![Datarock](https://drive.google.com/uc?id=1mJlk1v8qzROE-W5e7bwn5OS33Wzo06hw) -->
![Datarock](assets/datarock_logo_2_rect.jpeg)


*Data Science Project Template*
---
This template/repository contains a folder structure and several bash scripts that makes setting up a project rather straightforward. Current folders can serve as the basis and new folders can be added depending on the needs of a project. 

**TL/DR**
1. [Create a repo](https://github.com/organizations/Solve-Geosolutions/repositories/new)
2. Choose this template, a repository name and fill out the description 
3. git clone the repo
4. Choose your folders. Delete current ones or add ones you want. You can use . scripts/folder_structure/create_R_DS_folders.sh command to do it automatically for you
5. Go to the *settings.yaml* file and change the fields
6. run . scripts/initialise.sh to initialise to setup dvc and project
7. run . scripts/dvc_add_push.sh everytime you want to commit your data changes
8. Read below descriptions for more information

**How to use the template**
---

The template can be used in different ways. Easiest way is to go to create a new repository on solve github page [Click Here](https://github.com/organizations/Solve-Geosolutions/repositories/new). Then choose this template from the dropdown menu of *repository template* section. Choose a repository name for your new repository and add a description. Then click on the green Create Repository button below. 
   

You can then clone your repository either manually or using the following command:

``` 
git clone <repo> <directory>
```

Once you clone the repository, go to the *settings.yaml* file on your computer and change the following fields.  

+ **project_name** : Name of the repository. This name will be used to create a folder in the DVC remote location (S3, google drive, etc) and store the files under the sepcified folder. Best is to use the same name as the repository name to be consistent. 
+ **dvc_folders** : Folders to be tracked by DVC. List the folders separated by space, i.e., data models reports outputs
+ **dvc_remote** : DVC remote location. Could be an S3 or google drive location i.e,  s3://dvc-solve/test
+ **git_remote** : Github link of the repository. This will be used in the project initialisation 


**Requirements before initialisation**
---

This template includes certain tools such as dvc, git, aws, etc. If you have not used the template before, you might need to install some of the tools for the first time. Below are list of commands to install the required tools:

```
sudo apt-get install git
pip install dvc
pip install dvc[s3]
sudo apt-get install tree (linux)
brew install tree (for mac users)

```

***AWS***

To be able to push/pull data from the s3 bucket, we need to input the aws credentials. As the credentials are valid for 12 hours, you need to obtain the credentials every 12 hours you want to pull/push using dvc from s3. 

The credentials can be obtained from https://datarock.awsapps.com/start/ link. Choose datarock-applied-science and then click on 'Command line or programatic access link'. Then choose option 1 and copy/paste the credentials into the wsl/linux terminal.


***GIT***

If you have not setup your git, set up your name and email address as ib below:

```
git config --global user.name "John Doe"

git config --global user.email johndoe@example.com

```



**Project Initialisation**
---

Project initialisation comprises setting up of the dvc and git repository locally. These could be manually done of course. However, this repository contains useful scripts to automate project initialisation. As these scripts are shell scripts, use a linux based terminal to do the initialisation. 

Before setting up the project, create or delete folders that you would likely to use. We currently have two scripts to create standard Python or R data science folders. Depending on what language you are using, you can use the following scripts

```
. scripts/folder_structure/create_R_DS_folders.sh

```
or
```
. scripts/folder_structure/create_py_DS_folders.sh

```




Once the tree library is set up, you can initialise the project. If you are using windows, open the WSL terminal and go to the directory where the repository is locally located. If you are using linux, do the same in terminal. Following command will set up project.

```
. scripts/initialise.sh
```

Initialisation uses the values in *settings.yaml* file to setup the dvc and git properly. 

Note: This needs to be done when setting up the project. You dont need to use it again.

**Changes in the tracked data**
---

Once you add or change data in the tracked folders, your .dvc files stored in the dvc folder need an update. We can use below script to do that. The script basically updates the dvc files with the new changes and pushes the updated data in the remote. 

```
. scripts/dvc_add_push.sh
```

Note: everytime you update your dvc files, you need to stage changes in your git and include the modified .dvc files in your commit. 

If you decide to add new folder that contains the data and needs dvc to track, add the new folder in the *settings.yaml* dvc_folders and run the dvc_add_push.sh script. This will add your new folder in dvc



***Pre-commit actions***
This repository contains set of actions run prior to each commit. One of these is to create a file list of the data stored in the project. After each commit, dvc_files.md file will be updated with the current version of the files list. In addition, all the files in the project directory will be placed in files.txt file. You dont need to do antyhing, just commit as usual. 

**Folder Structure**
---

Here is a rough guideline on the folder structure that could be followed. This is only a guideline and is not a strict structure to follow. 

Top-level layout is as follows:


    ├── assets             				<- Folder containing company logos, images, configurations, etc.
    ├── README.md          				<- The top-level README containing project information.
    ├── docs               				<- Documents/info about the project
    ├── R         			        	<- Custom R functions used in the project
    │
    ├── src         			        <- Custom Python functions used in the project
    │
    ├── data
    │   ├── external       				<- Data from third party sources, could be additional or prediction datasets.
    │   ├── interim        				<- Intermediate data that has been transformed.
    │   ├── processed      				<- The final, canonical data sets for modeling.
    │   └── raw            				<- The original, immutable data dump.
    │
    │── codes               		 	<- Codes to create models, process data etc. .ipynb, .R or .py files
    │   ├── 01-data_preparation.R
    │   ├── 02-EDA.ipynb   	
    │   ├── 03-modelling.R    	
    │   ├── 04-evaluation.py           
    │
    │── rmds               		 		<- R Markdown files
    │   ├── 01-eda.rmd          	     
    │   ├── 02-modelling.rmd  	
    │
    │── outputs               		 	<- Outputs of processes
    │   ├── 01-eda.html          	     
    │   ├── 02-modelling.html    	
    │
    │── apps               		 		<- Shiny apps
    │   ├── 01-supervised_prediction.rmd          	     
    │   ├── 02-unsupervised_prediction.rmd 
    │
    ├── models             				<- Trained models, model predictions, or model summaries
