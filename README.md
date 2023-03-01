# Todo App

A todo application using hive as database

## Getting Started

Screen1(home_screen.dart)
   This screen has two card buttons,navigating to their respective names

Screen2(notes_list.dart)
    Screen Loads list of todo's(if available).User can edit or delete any todo as per requirement.
    Also user can add new todo by clicking over add button in bottom right corner which will navigate Next
    screen3(create_note.dart) for creating new todo.

    #Here all the functionality is being controlled by provider class notes_controller.dart for creating,updating
    and deleting any todo

Screen4(products_screen.dart)
    This screen loads list of products fetched from an Api.The list is hown in an gridview.
    User can add products to cart and can navigate to Screen5(products_cart.dart)

    #Here all the functionality is being controlled by provider class products_controller.dart for fetching products,
    adding them to cart and updating total price.


Other Folders
    widgets  => This folder consist of several reusable widgets.
    model    => This consist of several model classes.
    constanr => This consist of classes like appColor with global defined color varialbles  




A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
