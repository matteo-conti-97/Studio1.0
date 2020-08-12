package logic.boundary;

import java.util.ArrayList;
import java.util.List;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import logic.control.SuperviseController;

public class SuperviseGUI extends LibrarianGUI {
	List<Button> infoAccountBtnList;
	SuperviseController superviseController;
	List<String> usernameList;
	// InfoAccountSelectedGUI infoAccount;

	public SuperviseGUI() {
		infoAccountBtnList = new ArrayList<>(); //lista contenente tanti bottoni quanti sono gli utenti
        superviseController = new SuperviseController();
        usernameList = new ArrayList<>();
        fillUsernameList();
	}

	public Button createBtnSupervise(String nameBtn) {
		Button btnUser = new Button(nameBtn);
		btnUser.setMinWidth(450);
		btnUser.setMinHeight(40);
		return btnUser;
	}
	
	public void fillUsernameList() {
		usernameList = superviseController.fillSupervisePage(libraryBean.getMail());
	}

	public VBox createSuperviseGUI() {
		Label titleSupervisePage = createLabel("Studenti con cui hai interagito recentemente", 24);
		titleSupervisePage.setPadding(new Insets(50, 30, 10, 0));
		VBox content;
		HBox hBoxColumns = new HBox();
		hBoxColumns.setSpacing(20);
		hBoxColumns.setMaxHeight(300);
		ScrollPane spUsers = new ScrollPane();
	    for (int i=0; i<usernameList.size(); i++) {
	    	infoAccountBtnList.add(createBtnSupervise(usernameList.get(i)));
	    }
	    
		VBox vBoxUser = new VBox();
		for (int i=0; i<infoAccountBtnList.size(); i++) {
			vBoxUser.getChildren().add(infoAccountBtnList.get(i));
		}
		
		vBoxUser.setMaxSize(500, 500);
		vBoxUser.setAlignment(Pos.CENTER);
		vBoxUser.setSpacing(0);


		spUsers.setContent(vBoxUser);
		spUsers.setMinSize(460, 350);
		spUsers.setVbarPolicy(ScrollPane.ScrollBarPolicy.AS_NEEDED);
		spUsers.setHbarPolicy(ScrollPane.ScrollBarPolicy.NEVER);

		

		hBoxColumns.getChildren().addAll(spUsers);

		content = createPanel(titleSupervisePage, hBoxColumns);
		content.setMaxWidth(500);
		content.setAlignment(Pos.TOP_CENTER);
		//content.setPadding(new Insets(20, 0, 20, 0));
		
		
	
		return content;
	}


}
