# MVVM-C Demo App
A sample app demonstrating an approach to a strict MVVM implementation using coordinators.

---

Over the past couple of years I have fallen in love with the simplicity of the coordinator pattern, it provides an easy and clean way of managing page transitions.
With that in mind I wanted to develop a sample app that demonstrates the MVVM-C approach without compromising on the MVVM aspect.

To do this it required pushing protocols about as far as I could, each view controller conforms to `ModeledViewController` protocol, this specifies that any member have a view model object, the protocol makes use of associated types to allow the view controller to specify it's own view model type, this allows for the view controller to know about the view model and all methods available within.
So as the view model can talk back to the view controller a simple delegate was created allowing the view model to inform the view controller when it updated or when it errors.  The delegate methods are optional so it's up the view controller to decide if it want's to listen for those events.

The view model object are also members of a protocol, however this protocol is conformed to by a base view model object. This object contains weak references to the coordinator and delegate for the view model.

When it comes to loading a view controller there is a static method that allows the coordinator to instantiate the view controller in a single, east to read line of code.

```
let viewController = WelcomeViewController.instantiateFromStoryboard(storyboard: .Login, with: WelcomeViewModel(username: username), coordinator: self)
```
That's it... we specify the type of view controller, call `instantiateFromStoryboard` and tell it the storyboard we want to load the view controller from, pass a view model object and the reference to self for the coordinator. 
The `instantiateFromStoryboard` method then instantiates the view controller from the storyboard, assigns the view model to the view controller, sets the delegate of the view model to be the view controller and then finally sets the coordinator on the view model.

All this set up is hidden from the coordinator and allows for fast creation of pages and reduces the likelihood of forgetting a step that could render the view model or coordinator dysfunctional.

When it comes to transitioning from one view to another you simple call transition on the coordinator and pass a transition reference that the coordinator will need to be listening for.
There is also the option of passing an object to the coordinator to be passed to the next page (this can be observed in the transition from the login page to the welcome page)

---
### Data Flow

```
-- ViewController --(Calls method)--> ViewModel --(Calls transition)--> Coordinator --(Performs transition)--|
          ↑                               |
          |                               |
          ╰----(Calls delegate method)----╯
```
