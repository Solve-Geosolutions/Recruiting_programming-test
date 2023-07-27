![Datarock](assets/datarock_logo_2_rect.jpeg)


# Programming Test for Recruiting:

The primary objective of this programming test is to assess the problem-solving and programming abilities of the applicants. By presenting them with an uncommon coding problem, the test aims to gauge the applicants proficiency in devising a solution to a real-world challenge. The assessment strives to select individuals who demonstrate a solid foundation in problem-solving and programming, ensuring they are well-equipped to contribute effectively to the organization's technical endeavors.

## Design and Train a Deep Learning Model on a Subset of CIFAR10

For the following programming test, we will use the CIFAR10 dataset. You can read about this dataset and download it from [here](https://www.cs.toronto.edu/~kriz/cifar.html).

Follow the instructions below to write your program. Please write your program using ***Pytorch***. Upload your code to your GitHub repository using this template and send us the link to your repository. Please make sure your repository is public. 

1. Download the CIFAR10 dataset.
2. Write a code that takes images with labels *deer* and *truck* from the training and test subsets of CIFAR10 dataset.  
3. Design a Convolutional Neural Network (CNN) with four convolutional layers and two fully connected layers that outputs two probabilities. One for class *deer* and one for class *truck*.
4. Train your CNN on the images labeled *deer* and *truck* for 30 epochs.
5. Plot the training loss/accuracy and validation loss/accuracy of the model per epoch during training.
6. Plot two images labeled *deer* that the model predicts correctly and two images labeled *deer* that the model predicts wrongly.
7. Plot two images labeled *truck* that the model predicts correctly and two images labeled *truck* that the model predicts wrongly.

***IMPORTANT: Your code should be able to run directly on the CIFAR10 dataset files provided at the above link.*** 

## Outputs

The following files should be provided:

1. A file/files (in .py or .ipynb format) containing the code that does all the steps listed above.
2. A plot that shows the training loss/accuracy of the model. 
3. A plot that shows the validation loss/accruacy of the model. 
4. A plot that shows two images with labels *deer* that the model predicts correctly and two images with labels *deer* that the model predicts incorrectly. 
5. A plot that shows two images with labels *truck* that the model predicts correctly and two images with labels *truck* that the model predicts incorrectly.


## Environments

Please provide Information about how to setup the environment to be able to run your code. 


## Outputs 

Please provide information about where the requested outputs are located and in what order the code should be run. 