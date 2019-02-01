import java.util.Scanner;

import VIEW.*;
import java.io.IOException;

public class main {
	public static void main(String[] args) throws IOException {

		Scanner sc = new Scanner(System.in);
		int menu;

		while (true) {
			System.out.println("----- 게시물 메뉴 ----");
			System.out.println("1. 게시물 저장");
			System.out.println("2. 게시물 수정");
			System.out.println("3. 게시물 삭제");
			System.out.println("4. 게시물 조회");
			System.out.println("5. 프로그램 종료");
			System.out.print("번호 입력 :");

			menu = sc.nextInt();

			BoardInsertView insertion = new BoardInsertView();
			BoardSelectView selection = new BoardSelectView();
			BoardDeleteView deletion = new BoardDeleteView();
			BoardReviseView revision = new BoardReviseView();

			switch (menu) {
			case 1:
				System.out.println("게시물 저장 기능을 선택하셨습니다.");
				insertion.input();
				break;
			case 2:
				System.out.println("게시물 수정 기능을 선택하셨습니다.");
				revision.input();
				break;
			case 3:
				System.out.println("게시물 삭제 기능을 선택하셨습니다.");
				// deletion.input();
				break;
			case 4:
				System.out.println("게시물 조회 기능을 선택하셨습니다.");
				selection.input();
				break;
			case 5:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				System.out.println("wrong input");
				break;
			}
		}
	}
}
