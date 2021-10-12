# ShinyApp

## Summary
This procject was part of the coursera course **Data Sience Developing Data Products**. In 
this project a Shiny app was developed which takes the data from the **iris** dataset and
depending on the input from the user divides the data into different ratios of training and 
testing data. This data was then used to train and predict on a Linear Discriminant model.

## Components
### Category Slider
![MarineGEO circle logo](/assets/img/MarineGEO_logo.png "MarineGEO logo")
This slider lets you choose off which category the training and testing data will be based on.
The list of categorys to choose from is listed below:

- Sepal.Length    
- Sepal.Width     
- Petal.Length    
- Petal.Width

### Ratio Slider
![MarineGEO circle logo](/assets/img/MarineGEO_logo.png "MarineGEO logo")
This slider lets you choose the ratio or percentage of the iris data used to build the training set. 
The values ranges between 10% to 100% and steps in 10%.

### Train Button
![MarineGEO circle logo](/assets/img/MarineGEO_logo.png "MarineGEO logo")
This button executes the training and prediction, which displays a graph TRUE and False predictions. 
A Confusion Matrix results are also displayed benath the graph. 
![MarineGEO circle logo](/assets/img/MarineGEO_logo.png "MarineGEO logo")
