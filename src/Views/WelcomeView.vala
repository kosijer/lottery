using Granite.Widgets;

namespace Application {
public class WelcomeView : Gtk.ScrolledWindow {

    public WelcomeView(){ 
        var welcome_view = new Welcome("Add some names!", "Click the upper left button");

        this.add(welcome_view);
    }
}
}
