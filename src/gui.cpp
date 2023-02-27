#include "common.hpp"
#include "gui.hpp"

// left as global variable
GtkApplication *app;

static void app_activate(GtkApplication *app, gpointer user_data){
    GtkWidget *window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Silicone");
    gtk_window_set_default_size(GTK_WINDOW(window), 1280, 720);

    // components
    GtkWidget *header_bar = gtk_header_bar_new();

    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);

    gtk_window_present(GTK_WINDOW(window));
}

int GUI::init(const char *name){
    app = gtk_application_new(name, G_APPLICATION_DEFAULT_FLAGS);
    
    g_signal_connect(app, "activate", G_CALLBACK(app_activate), NULL);

    int stat = g_application_run(G_APPLICATION(app), 0, NULL);
    g_object_unref(app);
    return stat;
}
