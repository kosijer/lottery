using Granite.Widgets;

namespace RepositoriesManager {
public class MainWindow : Gtk.Window{

    private ListManager listManager = ListManager.get_instance();
    private StackManager stackManager = StackManager.get_instance();

    construct {
        set_default_size(200, 810);
        set_titlebar (new HeaderBar());

        stackManager.loadViews(this);

        listManager.getList().getRepositories("");

        stackManager.getStack().visible_child_name = "welcome-view";
    }
}
}