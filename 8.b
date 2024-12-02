from bokeh.plotting import figure, show, output_file
from bokeh.models import ColumnDataSource
from bokeh.layouts import gridplot,column
from math import pi
x=[1,2,3,4,5]
y=[2,4,6,8,10]
output_file("Bokeh_plots.html")
p1 = figure(title="Line Plot", x_axis_label="X-Axis", y_axis_label="Y-Axis")
p1.line(x, y, line_color="blue", line_width=2)

p2 = figure(title="Scatter Plot", x_axis_label="X-Axis", y_axis_label="Y-Axis")
p2.circle(x, y, size=10, color="green", alpha=0.6)

categories = ['Cat A', 'Cat B', 'Cat C', 'Cat D']
values = [30, 45, 15, 10]
p3 = figure(x_range=categories, title="Bar Plot", x_axis_label="X-Axis", y_axis_label="Y-Axis")
p3.vbar(x=categories, top=values, width=0.5, color="orange")

data = {'categories': ['Cat A', 'Cat B', 'Cat C', 'Cat D'], 'values': [30, 45, 15, 10]}
angles = [pi/4, pi/2, pi, 1.5*pi]

total=sum(values)
angles=[value/total*2*pi for value in values]
start_angles=[sum(angles[:i])for i in range (len(angles))]
end_angles=[sum(angles[:i+1])for i in range(len(angles))]
source_pie=ColumnDataSource(data=dict(start=start_angles,end=end_angles,color=['red','green','blue','orange'],categories=categories,values=values))
p4 = figure(title="Pie Chart")
p4.wedge(x=0, y=0, radius=0.4, start_angle="start", end_angle="end", 
         line_color="white", fill_color="color", legend_field="Categories",source=source_pie)

layout=column(p1,p2,p3,p4)
show(layout)
