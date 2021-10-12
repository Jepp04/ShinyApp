# ShinyApp

## Summary
This project was part of the coursera course **Data Science Developing Data Products**. In 
this project a Shiny app was developed which takes the data from the **iris** dataset and
depending on the input from the user divides the data into different ratios of training and 
testing data. This data was then used to train and predict on a Linear Discriminant model.

## Components
### Category Slider
![Category Slider](CatSlider.png "Category Slider")

This slider lets you choose off which category the training and testing data will be based on.
The list of categories to choose from is listed below:

- Sepal.Length    
- Sepal.Width     
- Petal.Length    
- Petal.Width

### Ratio Slider
![Ratio Slider](RatioSlider.png "Ratio Slider")

This slider lets you choose the ratio or percentage of the iris data used to build the training set. 
The values ranges between 10% to 100% and steps in 10%.

### Train Button
![Train Button](TrainButton.png "Train Button")

This button executes the training and prediction, which displays a graph TRUE and False predictions. 
A Confusion Matrix results are also displayed beneath the graph. 

![Prediction](Prediction.png "Prediction")
