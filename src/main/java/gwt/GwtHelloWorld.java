package gwt;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.HorizontalPanel;
import com.google.gwt.user.client.ui.Label;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextBox;
import com.google.gwt.user.client.ui.VerticalPanel;

public class GwtHelloWorld implements EntryPoint {

    private VerticalPanel mainPanel = new VerticalPanel();
    private HorizontalPanel subPanel = new HorizontalPanel();
    private TextBox nameTextBox = new TextBox();
    private Button submitButton = new Button("Greet Me");
    private Label greetingLabel = new Label();

    /**
     * Entry point method.
     */
    public void onModuleLoad() {

        // Assemble Sub panel.
        subPanel.add(nameTextBox);
        subPanel.add(submitButton);
        subPanel.addStyleName("subPanel");

        // Assemble Main panel.
        mainPanel.add(subPanel);
        mainPanel.add(greetingLabel);

        // Associate the Main panel with the HTML host page.
        RootPanel.get("formDiv").add(mainPanel);

        // Move cursor focus to the input box.
        nameTextBox.setFocus(true);

        // Listen for mouse events on the greeting button.
        submitButton.addClickHandler(new ClickHandler() {
            public void onClick(ClickEvent event) {
                sayHello();
            }
        });

    }

    /**
     * Display a greeting message
     */
    private void sayHello() {
        final String name = nameTextBox.getText().toUpperCase().trim();
        nameTextBox.setFocus(true);
        nameTextBox.setText("");
        greetingLabel.setText("Hello " + name);
        greetingLabel.setStyleName("greetingLabel");
    }

}