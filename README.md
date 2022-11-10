Explanation of classes:
- The main execution class is "Box2D", with the execution, creation and sampling of the car and the surface.
- The "Car" class is where the creation of the chassis and the two wheelsis made and they are put together. One wheel is created a little more turned than the other so that it can be seen that they are independent.
- The "Wheel" class that contains the creation and sampling logic of the wheel object.
- The "Surface" class that creates and displays the surface with first an inclined part and then a sinusoidal part.
- Finally, the "Chassis" class that creates the car's chassis by joining two rectangles.
In practice, The forces on the wheels are appropriate to the forces acting on the car so that they don't overturn it. These measures could be changed if you wanted the car to do some other effect. Both the chassis and the wheels have physics made with the fixture, so it has an effect more suited to the real world.
